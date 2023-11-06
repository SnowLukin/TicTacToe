//
//  Page.swift
//  TicTacToe
//
//  Created by Snow Lukin on 06.11.2023.
//

import Foundation

enum Page: Identifiable, Hashable {
    case gameList
    case game(_ game: Game)
    
    var id: String {
        switch self {
        case .gameList:
            return "gameList"
        case .game(let game):
            return "game(\(game.name))"
        }
    }
}
