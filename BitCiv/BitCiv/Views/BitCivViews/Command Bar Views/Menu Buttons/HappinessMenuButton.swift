//
//  HappinessMenuButton.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 12/16/20.
//  Copyright © 2020 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct HappinessMenuButton: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    let geometryWidth: CGFloat
    
    let geometryHeight: CGFloat
    
    var viewWidth: CGFloat {
        geometryWidth
    }
    
    var viewHeight: CGFloat {
        geometryHeight / 10
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .foregroundColor(viewModel.happinessColor)
            .overlay(
                Circle()
                    .frame(width: viewWidth / 2, height: viewHeight / 2, alignment: .center)
                    .opacity(0.3)
                    .foregroundColor(Color.white)
                    .overlay(
                        Text(viewModel.happinessEmoji)
                         .foregroundColor(Color.black)
                            .font(.largeTitle)
                    )
            )
    }
    
    let cornerRadius: CGFloat = 15.0
}
