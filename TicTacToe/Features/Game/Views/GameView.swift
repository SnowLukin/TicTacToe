//
//  GameView.swift
//  TicTacToe
//
//  Created by Snow Lukin on 06.11.2023.
//

import SwiftUI

struct GameView: View {
    
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = GameViewModel()
    
    let game: Game
    
    var body: some View {
        ZStack {
            Text(viewModel.activePlayerText)
                .font(.title.bold())
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding()
            VStack {
                Text("Crosses Score: \(viewModel.crossScore)")
                TicTacGridView(viewModel: viewModel)
                Text("Noughts Score: \(viewModel.noughtScore)")
            }
        }
        .onAppear {
            viewModel.crossScore = game.crossScore
            viewModel.noughtScore = game.noughtScore
        }
        .onChange(of: viewModel.crossScore) { oldValue, newValue in
            game.crossScore = viewModel.crossScore
        }
        .onChange(of: viewModel.noughtScore) { oldValue, newValue in
            game.noughtScore = viewModel.noughtScore
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
