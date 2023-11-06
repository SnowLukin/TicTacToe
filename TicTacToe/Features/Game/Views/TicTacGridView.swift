//
//  TicTacGridView.swift
//  TicTacToe
//
//  Created by Snow Lukin on 06.11.2023.
//

import SwiftUI

struct TicTacGridView: View {
    
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        Grid {
            ForEach(viewModel.matrix.indices, id: \.self) { row in
                GridRow {
                    ForEach(viewModel.matrix[row].indices, id: \.self) { column in
                        TicTacCellView(cell: viewModel.matrix[row][column]) {
                            viewModel.updateCell(row: row, column: column)
                        }
                    }
                }
            }
        }
        .padding(6)
        .background(Color.black)
        .border(Color.black, width: 6)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .alert(viewModel.alertMessage, isPresented: $viewModel.showGameResultAlert) {
            Button("Ok") {
                viewModel.restart()
            }
        }
    }
}

#Preview {
    @StateObject var viewModel = GameViewModel()
    return TicTacGridView(viewModel: viewModel)
}
