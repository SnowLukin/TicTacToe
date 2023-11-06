//
//  TicTacSignView.swift
//  TicTacToe
//
//  Created by Snow Lukin on 03.11.2023.
//

import SwiftUI

struct TicTacSignView: View {
    
    var cell: TicTacCell
    
    var body: some View {
        ZStack {
            if let resource = cell.image {
                Image(resource)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(cell.color)
            }
        }
    }
}

#Preview {
    Grid {
        TicTacSignView(cell: .init(type: .cross))
            .frame(width: 100, height: 100)
        TicTacSignView(cell: .init(type: .circle))
            .frame(width: 100, height: 100)
    }
}
