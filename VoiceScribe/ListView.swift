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
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(memos: .constant(Memo.sampleData))
    }
}
