//
//  DetailView.swift
//  VoiceScribe
//
//  Created by Jack long on 8/20/23.
//
import Foundation
import SwiftUI

struct DetailView: View {
    @Binding var memo: Memo
    @State private var showingAlert = false
    @State private var alertTitle = "Error"
    @State private var alertMessage = "Something went wrong."

    var body: some View {
        VStack {
            List {
                Section(header: Text("Details")) {
                    HStack {
                        Label("Length", systemImage: "clock")
                        Spacer()
                        Text("\(memo.length) minutes")
                    }
                }
                Section(header: Text("Transcript")) {
                    TranscriptView(transcript: memo.transcript)
                }
                Section(header: Text("AI Stuff")) {
                    Button("Save Transcript") {
                        saveMemo()
                    }
                    .disabled(memo.saveStatus)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                    Button("Create Note") {
//                        createNote(memoId: memo.id)
                    }
                    .disabled(!memo.saveStatus)
                }
            }
        }
        .navigationTitle(memo.title)
    }

    func saveMemo() {
        CloudflareWorkerService.shared.postMemo(memo) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.memo.saveStatus = true
                    self.alertTitle = "Success"
                    self.alertMessage = "Memo successfully saved."
                    
                case .failure(let error):
                    self.alertTitle = "Error"
                    self.alertMessage = error.localizedDescription
                }
                self.showingAlert = true
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(memo: .constant(Memo.sampleData[0]))
        }
    }
}
