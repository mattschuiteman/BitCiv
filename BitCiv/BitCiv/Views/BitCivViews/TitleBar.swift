//
//  TItleBar.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/5/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct TitleBar: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    var geometryHeight: CGFloat
    
    var geometryWidth: CGFloat
    
    var viewHeight: CGFloat {
        geometryHeight / 14
    }
    
    var viewWidth: CGFloat {
        geometryWidth
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color.blue)
            .edgesIgnoringSafeArea(.top)
            .overlay(
                HStack {
                    VStack {
                        Text(viewModel.bitCivGame.civName).font(.headline)
                        Text(viewModel.bitCivGame.civDenonym).font(.caption)
                    }
                    
                    Text("Year: \(viewModel.year) \(viewModel.notation)")
                    Text(viewModel.age).font(.caption)
                    
                }
            )
            .frame(width: viewWidth, height: viewHeight, alignment: .center)
    }
}
