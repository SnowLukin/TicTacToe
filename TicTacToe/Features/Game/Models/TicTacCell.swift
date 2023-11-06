//
//  TicTacCell.swift
//  TicTacToe
//
//  Created by Snow Lukin on 03.11.2023.
//

import SwiftUI

struct TicTacCell {
    var type: PlayerType?
    
    var color: Color {
        switch type {
        case .cross:
            Color.red
        case .circle:
            Color.blue
        case .none:
            Color.clear
        }
    }
    
    var image: ImageResource? {
        switch type {
        case .cross:
            .cross
        case .circle:
            .circle
        case .none:
            nil
        }
    }
}
