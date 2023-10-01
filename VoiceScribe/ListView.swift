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
        ZStack (alignment: .bottom) {
            NavigationStack {
                List($memos) { $memo in
                    NavigationLink(destination: DetailView(memo: $memo)) {
                        CardView(memo: memo)
                    }
                }
                .navigationTitle("Memos")
                HStack(spacing: 50) {
                    Button(action: {
                        // Action for audio recording
                        isRecording = true
                    }) {
                        Image(systemName: "mic")
                            .imageScale(.large)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())
                    }

                    Button(action: {
                        // Action for taking a picture
                        print("Camera activated")
                    }) {
                        Image(systemName: "camera")
                            .imageScale(.large)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white.opacity(0.8))
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
