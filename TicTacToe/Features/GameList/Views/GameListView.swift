//
//  GameListView.swift
//  TicTacToe
//
//  Created by Snow Lukin on 06.11.2023.
//

import SwiftUI
import SwiftData

struct GameListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var coordinator: Coordinator
    @Query private var games: [Game]
    
    @State private var showEditingAlert = false
    @State private var gameBeingEdited: Game?
    @State private var gameTF = ""
    
    var body: some View {
        List(games) { game in
            HStack {
                Text(game.name)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary)
            }
            .contentShape(Rectangle())
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {
                    modelContext.delete(game)
                } label: {
                    Label("Delete", systemImage: "trash")
                }
                
                Button {
                    gameBeingEdited = game
                    showEditingAlert.toggle()
                } label: {
                    Label("Edit", systemImage: "pencil")
                }
            }
            .onTapGesture {
                coordinator.push(.game(game))
            }
        }
        .navigationTitle("Games")
        .toolbar {
            Button("Add", systemImage: "plus") {
                let newGame = Game(name: "New game")
                modelContext.insert(newGame)
            }
        }
        .alert("New game name", isPresented: $showEditingAlert) {
            TextField("Enter new game name", text: $gameTF)
            
            Button("Cancel", role: .cancel) {
                gameTF.removeAll()
            }
            
            Button("OK") {
                gameBeingEdited?.name = gameTF
                gameTF.removeAll()
            }
        }
    }
}


#Preview {
    GameListView()
}
