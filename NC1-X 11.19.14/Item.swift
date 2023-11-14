//
//  Item.swift
//  NC1-X
//
//  Created by Matteo Cotena on 14/11/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
