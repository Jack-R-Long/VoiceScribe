//
//  Memo.swift
//  VoiceScribe
//
//  Created by Jack long on 8/20/23.
//

import Foundation

struct Memo: Identifiable, Codable{
    var id: UUID
    var title: String
    var length: Int
    var transcript: String?
    var savedToCloudflare: SaveStaus = .unsaved
    
    init(id: UUID=UUID(), title: String, length: Int, transcript: String? = nil, savedToCloudflare: SaveStaus = .unsaved) {
        self.id = id
        self.title = title
        self.length = length
        self.transcript = transcript
        self.savedToCloudflare = savedToCloudflare
    }
}

extension Memo {
    static let sampleData: [Memo] =
    [
        Memo(title: "Anakin's Monday Notes", length: 12, transcript: "Hey, it's me, Anakin. So, I've gotta remember to work on the pod after school. The left thruster's acting up again, and if I'm gonna race in Boonta Eve, it needs to be in top shape. Oh, and C3PO's wiring's all jumbled again, probably because I took some parts for the pod. Gotta fix him too. Man, he's surprisingly fragile for a droid! And lastly, ugh, Greedo. He keeps bugging me about the credits I owe him. I mean, who does he think he is? I beat him fair and square in that dice game last week. He's so annoying. Alright, memo over. Tomorrow's gonna be a busy day.", savedToCloudflare: .saved),
        Memo(title: "Catch up with Evelyn", length: 8, transcript: "placeholder", savedToCloudflare: .unsaved),
        Memo(title: "Weekly planning with Reid", length: 15, transcript: "placeholder", savedToCloudflare: .unsaved),
        Memo(title: "Visit with Will", length: 8, transcript: "placeholder", savedToCloudflare: .unsaved)
    ]
}

enum SaveStaus: String, Codable {
    case unsaved
    case saving
    case saved
}
