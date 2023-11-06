//
//  PreviewContainer.swift
//  TicTacToe
//
//  Created by Snow Lukin on 06.11.2023.
//

import SwiftUI
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Game.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        for game in SampleGames.contents {
            container.mainContext.insert(game)
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
