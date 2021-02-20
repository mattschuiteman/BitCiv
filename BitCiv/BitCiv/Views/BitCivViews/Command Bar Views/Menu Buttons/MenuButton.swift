//
//  MenuButton.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 12/14/20.
//  Copyright © 2020 Matthew Schuiteman. All rights reserved.
//


import SwiftUI

struct MenuButton: View {
    
    let emoji: String
    
    let color: Color
    
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
            .foregroundColor(color)
            .overlay(
                Circle()
                    .frame(width: viewWidth / 2, height: viewHeight / 2, alignment: .center)
                    .opacity(0.3)
                    .foregroundColor(Color.white)
                    .overlay(
                        Text(emoji)
                            .foregroundColor(Color.black)
                            .font(.largeTitle)
                    )
            )
    }
    
    let cornerRadius: CGFloat = 15.0
}
