//
//  VoiceScribeApp.swift
//  VoiceScribe
//
//  Created by Jack long on 8/20/23.
//

import SwiftUI

@main
struct VoiceScribeApp: App {
    @State private var memos = Memo.sampleData
    var body: some Scene {
        WindowGroup {
            ListView(memos: $memos)
        }
    }
}
