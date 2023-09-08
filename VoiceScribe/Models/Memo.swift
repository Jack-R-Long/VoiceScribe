//
//  Memo.swift
//  VoiceScribe
//
//  Created by Jack long on 8/20/23.
//

import Foundation

struct Memo: Identifiable {
    var id: UUID
    var title: String
    var length: Int
    var transcript: String?
    
    init(id: UUID=UUID(), title: String, length: Int, transcript: String? = nil) {
        self.id = id
        self.title = title
        self.length = length
        self.transcript = transcript
    }
}

extension Memo {
    static let sampleData: [Memo] =
    [
        Memo(title: "Morning meeting", length: 12, transcript: "This is a recorded message"),
        Memo(title: "Catch up with Evelyn", length: 8),
        Memo(title: "Weekly planning with Reid", length: 15),
        Memo(title: "Visit with Will", length: 8)
    ]
}
