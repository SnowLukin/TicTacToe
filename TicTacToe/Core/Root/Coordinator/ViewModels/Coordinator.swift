//
//  Coordinator.swift
//  TicTacToe
//
//  Created by Snow Lukin on 06.11.2023.
//

import SwiftUI

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .gameList:
            GameListView()
        case .game(let game):
            GameView(game: game)
        }
    }
}
