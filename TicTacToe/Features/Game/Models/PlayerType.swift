//
//  PlayerType.swift
//  TicTacToe
//
//  Created by Snow Lukin on 06.11.2023.
//

import Foundation

enum PlayerType {
    case cross
    case circle
    
    var message: String {
        switch self {
        case .cross:
            "Crosses"
        case .circle:
            "Noughts"
        }
    }
}
