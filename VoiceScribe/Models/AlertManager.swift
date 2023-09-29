//
//  Alert.swift
//  VoiceScribe
//
//  Created by Jack long on 9/28/23.
//

import Foundation

class AlertManager: ObservableObject {
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
}
