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
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecordingView(memos: .constant(Memo.sampleData))
        }
    }
}

