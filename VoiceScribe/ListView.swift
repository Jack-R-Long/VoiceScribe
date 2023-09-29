//
//  ContentView.swift
//  VoiceScribe
//
//  Created by Jack long on 8/20/23.
//

import SwiftUI

struct ListView: View {
    @State private var isRecording = false
    @Binding var memos: [Memo]

    @ObservedObject var alertManager: AlertManager

    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void

    var body: some View {
        NavigationStack {
            List($memos) { $memo in
                NavigationLink(destination: DetailView(memo: $memo)) {
                    CardView(memo: memo)
                }
            }
            .navigationTitle("Memos")
            .toolbar {
                Button(action: { isRecording = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        // TODO: - make NewMemoSheet.swift
        .sheet(isPresented: $isRecording) {
            NavigationStack {
                RecordingView(memos: $memos)
                    .toolbar {
                        Button("Done") {
                            isRecording = false
                        }
                    }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
        // Alert for CloudFlare memo post
        .alert(isPresented: $alertManager.showAlert) {
            Alert(title: Text("Error"),
                  message: Text(alertManager.alertMessage),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        let alertManager = AlertManager()
        ListView(memos: .constant(Memo.sampleData), alertManager: alertManager, saveAction: {})
    }
}
