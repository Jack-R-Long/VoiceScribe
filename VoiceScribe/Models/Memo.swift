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
    var saveStatus: Bool
    
    init(id: UUID=UUID(), title: String, length: Int, transcript: String? = nil, saveStatus: Bool = false) {
        self.id = id
        self.title = title
        self.length = length
        self.transcript = transcript
        self.saveStatus = saveStatus
    }
}

extension Memo {
    static let sampleData: [Memo] =
    [
        Memo(title: "Morning meeting", length: 12, transcript: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Integer feugiat scelerisque varius morbi enim nunc. Sit amet dictum sit amet justo donec enim. In eu mi bibendum neque egestas congue quisque egestas diam. Amet luctus venenatis lectus magna fringilla urna porttitor. Cras pulvinar mattis nunc sed. A diam sollicitudin tempor id eu nisl nunc. Amet venenatis urna cursus eget. Hac habitasse platea dictumst quisque sagittis purus sit. Maecenas sed enim ut sem. A pellentesque sit amet porttitor eget dolor. Erat velit scelerisque in dictum non consectetur a erat nam. Risus viverra adipiscing at in tellus. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet. Sit amet est placerat in egestas erat. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien. Quisque non tellus orci ac auctor augue. Faucibus vitae aliquet nec ullamcorper. Varius quam quisque id diam vel quam. Venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam.  Fermentum et sollicitudin ac orci. Cras fermentum odio eu feugiat pretium. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum arcu vitae. Pellentesque diam volutpat commodo sed egestas. Facilisi nullam vehicula ipsum a arcu cursus. Semper viverra nam libero justo laoreet sit amet cursus. Mauris sit amet massa vitae tortor condimentum lacinia. Posuere sollicitudin aliquam ultrices sagittis orci. Purus viverra accumsan in nisl. Posuere urna nec tincidunt praesent semper feugiat. Diam maecenas ultricies mi eget mauris. Sit amet massa vitae tortor condimentum. Ac turpis egestas integer eget. Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Et odio pellentesque diam volutpat commodo sed egestas. Neque convallis a cras semper auctor. Ipsum nunc aliquet bibendum enim. Nulla posuere sollicitudin aliquam ultrices sagittis orci. Adipiscing elit ut aliquam purus.  Pulvinar pellentesque habitant morbi tristique senectus et netus et malesuada. Est ullamcorper eget nulla facilisi etiam dignissim diam quis enim. Orci a scelerisque purus semper eget duis at tellus at. Semper feugiat nibh sed pulvinar proin gravida hendrerit lectus. Quis blandit turpis cursus in hac habitasse. Lacus sed viverra tellus in hac habitasse. Mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et netus. Tellus orci ac auctor augue mauris augue neque gravida in. Donec adipiscing tristique risus nec feugiat. Nibh cras pulvinar mattis nunc. Massa ultricies mi quis hendrerit dolor magna eget est lorem. Egestas quis ipsum suspendisse ultrices gravida dictum fusce. Diam donec adipiscing tristique risus nec. Rhoncus urna neque viverra justo nec ultrices dui. In est ante in nibh mauris cursus mattis. Tempor nec feugiat nisl pretium fusce id velit ut tortor. A iaculis at erat pellentesque adipiscing. Eu facilisis sed odio morbi quis commodo. Elementum facilisis leo vel fringilla. At augue eget arcu dictum varius duis at consectetur. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Urna condimentum mattis pellentesque id nibh. Aliquet enim tortor at auctor. Felis eget nunc lobortis mattis aliquam. Purus in massa tempor nec feugiat nisl pretium. Vitae justo eget magna fermentum iaculis eu non diam. Malesuada proin libero nunc consequat interdum varius sit amet. Cras pulvinar mattis nunc sed blandit libero volutpat. Condimentum vitae sapien pellentesque habitant morbi tristique senectus et netus. In aliquam sem fringilla ut morbi tincidunt. Varius duis at consectetur lorem donec massa sapien faucibus et. Nulla aliquet enim tortor at auctor urna nunc. Tincidunt id aliquet risus feugiat in. Leo a diam sollicitudin tempor id eu nisl. Pulvinar mattis nunc sed blandit libero volutpat sed cras. Bibendum ut tristique et egestas quis ipsum suspendisse. Aliquam etiam erat velit scelerisque in dictum non consectetur. Eu nisl nunc mi ipsum faucibus vitae. Sapien nec sagittis aliquam malesuada bibendum arcu. Libero justo laoreet sit amet cursus.", saveStatus: false),
        Memo(title: "Catch up with Evelyn", length: 8, transcript: "placeholder", saveStatus: false),
        Memo(title: "Weekly planning with Reid", length: 15, transcript: "placeholder", saveStatus: false),
        Memo(title: "Visit with Will", length: 8, transcript: "placeholder", saveStatus: false)
    ]
}
