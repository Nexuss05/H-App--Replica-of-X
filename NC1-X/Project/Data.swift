//
//  Data.swift
//  NC1-X
//
//  Created by Matteo Cotena on 14/11/23.
//

import Foundation
import SwiftData

@Model
class Tweet:Identifiable {
    var id: UUID = UUID()
    var nickname: String
//    var icon: Data?
    var text: String
    var image: Data?
//    var like: Int
    var type: Bool
    
//    var timestamp: Date
    
//    init(nickname: String, icon: Data, text: String, image: Data?, like: Int) {
    init(id: UUID = UUID(), nickname: String, text: String, image: Data?, type: Bool) {
        self.nickname = nickname
//        self.icon = icon
        self.text = text
        self.image = image ?? Data()
//        self.like = like
        self.type = type
        
//        self.timestamp = timestamp
    }
}

//@Model
//class Account {
//    var id: UUID = UUID()
//    var nome: String
//    var cognome: String
//    var nickname: String
//
//    init(nome: String, cognome: String, nickname: String) {
//        self.nome = nome
//        self.cognome = cognome
//        self.nickname = nickname
//    }
//}
