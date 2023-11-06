//
//  TicTacCellView.swift
//  TicTacToe
//
//  Created by Snow Lukin on 03.11.2023.
//

import SwiftUI

struct TicTacCellView: View {
    
    let size: CGFloat = 100
    let color: Color = .white
    
    let cell: TicTacCell
    
    let completion: () -> ()
    
    var body: some View {
        Button {
            Haptics.shared.play(.medium)
            withAnimation {
                completion()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(color)
                    .frame(width: size, height: size)
                    .overlay {
                        TicTacSignView(cell: cell)
                            .padding()
                    }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    TicTacCellView(cell: .init(type: .circle)) {}
}
