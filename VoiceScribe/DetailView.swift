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
                    if memo.savedToCloudflare == .saving {
                        Text("Saving...").foregroundColor(.gray)
                    } else if memo.savedToCloudflare == .saved {
                        Text("Saved!").foregroundColor(.green)
                    } else {
                        Text("Not Saved!").foregroundColor(.red)
                    }
                    // CreateAINoteView(memo: $memo)
                    
                }
            }
            .navigationTitle(memo.title)
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
