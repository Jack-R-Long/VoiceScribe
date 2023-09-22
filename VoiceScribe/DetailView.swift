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
                    TranscriptView( transcript: memo.transcript)
                }
                Section(header: Text("Note")) {
                    Button("Save Memo") {
                        postMemo(memo: memo)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                }
            }
        }
        .navigationTitle(memo.title)
    }
    
    func postMemo(memo: Memo) {
        let url = URL(string: "https://voice-scribe.jack-attack.workers.dev")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(memo)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    self.alertTitle = "Error"
                    self.alertMessage = error.localizedDescription
                    self.showingAlert = true
                }
            } else if let data = data, let response = response as? HTTPURLResponse {
                let str = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    if response.statusCode == 200 {
                        self.alertTitle = "Success"
                        self.alertMessage = "Memo successfully saved."
                    } else {
                        self.alertTitle = "Failure"
                        self.alertMessage = "Failed to save memo. Server responded with \(str ?? "unknown error")."
                    }
                    self.showingAlert = true
                }
            }
        }
        task.resume()
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(memo: .constant(Memo.sampleData[0]))
        }
    }
}
