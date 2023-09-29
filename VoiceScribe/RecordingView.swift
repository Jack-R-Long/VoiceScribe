//
//  RecordingView.swift
//  VoiceScribe
//
//  Created by Jack long on 8/22/23.
//

import SwiftUI

struct RecordingView: View {
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    @StateObject var alertManager = AlertManager()

    @Binding var memos: [Memo]

    var body: some View {
        VStack {
            RecordingAnimation(isRecording: isRecording)
        }
        .onAppear {
            startRecording()
        }
        .onDisappear {
            stopRecording()
        }
    }

    private func startRecording() {
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        isRecording = true
    }

    private func stopRecording() {
        speechRecognizer.stopTranscribing()
        isRecording = false

        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDateString = formatter.string(from: currentDate)

        let newMemo = Memo(title: currentDateString, length: 6, transcript: speechRecognizer.transcript)
        memos.append(newMemo)

        // Call the CloudflareWorkerService to post the new memo
        CloudflareWorkerService.shared.postMemo(newMemo) { result in
            switch result {
            case .success:
                print("Memo successfully posted.")
                // You can also set newMemo's saveState here, if it exists.
                // newMemo.saveState = true

                // If needed, you can save the memo locally using the MemoStore's save function

            case .failure(let error):
                // Update the alert state variables
                alertManager.alertMessage = "Error posting memo: \(error.localizedDescription)"
                alertManager.showAlert = true
            }
        }
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecordingView(memos: .constant(Memo.sampleData))
        }
    }
}
