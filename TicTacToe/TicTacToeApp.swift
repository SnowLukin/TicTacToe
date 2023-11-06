//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Snow Lukin on 03.11.2023.
//

import SwiftUI
import SwiftData

@main
struct TicTacToeApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
        }
        .modelContainer(for: [Game.self])
    }
}
