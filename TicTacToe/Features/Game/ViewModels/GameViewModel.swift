//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Snow Lukin on 06.11.2023.
//

import Foundation

typealias Matrix = [[TicTacCell]]

final class GameViewModel: ObservableObject {
    
    @Published var matrix = Matrix()
    @Published var activePlayerType: PlayerType = .cross
    
    @Published var crossScore = 0
    @Published var noughtScore = 0
    
    @Published var showGameResultAlert = false
    @Published var alertMessage = "Draw"
    
    var activePlayerText: String {
        switch activePlayerType {
        case .cross:
            "Crosses Turn"
        case .circle:
            "Noughts Turn"
        }
    }
    
    init() {
        restart()
    }
    
    func restart() {
        matrix = Matrix(
            repeating: Array(repeating: TicTacCell(), count: 3),
            count: 3
        )
    }
    
    func updateCell(row: Int, column: Int) {
        if row < matrix.count, column < matrix[row].count, matrix[row][column].type == nil {
            matrix[row][column] = TicTacCell(type: activePlayerType)
            
            if isVictory() {
                switch activePlayerType {
                case .cross:
                    crossScore += 1
                case .circle:
                    noughtScore += 1
                }
                
                alertMessage = activePlayerType.message + " Won!"
                showGameResultAlert = true
            } else if isDraw() {
                alertMessage = "Draw!"
                showGameResultAlert = true
            }
            
            activePlayerType = activePlayerType == .cross ? .circle : .cross
        }
    }
}

extension GameViewModel {
    
    private func isDraw() -> Bool {
        for row in matrix {
            for cell in row {
                if cell.type == nil {
                    return false
                }
            }
        }
        return true
    }
    
    private func isVictory() -> Bool {
        // Check rows
        rowIterator: for row in 0...2 {
            for column in 0...2 {
                if !isSameCellType(row, column) {
                    continue rowIterator
                }
            }
            return true
        }
        
        // Check columns
        columnIterator: for column in 0...2 {
            for row in 0...2 {
                if !isSameCellType(row, column) {
                    continue columnIterator
                }
            }
            return true
        }
        
        // Check diagonals
        if isSameCellType(0, 0), isSameCellType(1, 1), isSameCellType(2, 2) {
            return true
        }
        
        if isSameCellType(2, 0), isSameCellType(1, 1), isSameCellType(0, 2) {
            return true
        }
        
        return false
    }
    
    private func isSameCellType(_ row: Int, _ column: Int) -> Bool {
        activePlayerType == matrix[row][column].type
    }
}
