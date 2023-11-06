//
//  GameScore.swift
//  TicTacToe
//
//  Created by Snow Lukin on 06.11.2023.
//

import Foundation
import SwiftData

@Model
final class Game: Identifiable {
    @Attribute(.unique) var id: String
    var name: String
    var crossScore: Int
    var noughtScore: Int
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.crossScore = 0
        self.noughtScore = 0
    }
}
