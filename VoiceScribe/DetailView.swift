//
//  DetailView.swift
//  VoiceScribe
//
//  Created by Jack long on 8/20/23.
//

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
                    if let transcript = memo.transcript {
                        Text(transcript)
                    } else {
                        Text("No Transcript Available")
                    }
                }
            }
        }
        .navigationTitle(memo.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(memo: .constant(Memo.sampleData[0]))
        }
    }
}
