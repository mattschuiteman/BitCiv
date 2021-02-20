//
//  DataView.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/5/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct DataView: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    var geometryHeight: CGFloat
    var geometryWidth: CGFloat
    
    
    var body: some View {
        
        Rectangle().frame(width: geometryWidth * 0.95, height: geometryHeight * 0.30).foregroundColor(Color.white)
            .overlay(
                
                VStack(spacing: 0) {

                    ProgressBar(civVariable: viewModel.currency, civVariableCapacity: viewModel.currencyCapacity, geometryHeight: geometryHeight, geometryWidth: geometryWidth, emoji: viewModel.currencyEmoji, color: Color.currencyColor)

                    ProgressBar(civVariable: viewModel.production, civVariableCapacity: viewModel.productionCapacity, geometryHeight: geometryHeight, geometryWidth: geometryWidth, emoji: viewModel.productionEmoji, color: Color.productionColor)

                    ProgressBar(civVariable: viewModel.culture, civVariableCapacity: viewModel.cultureCapacity, geometryHeight: geometryHeight, geometryWidth: geometryWidth, emoji: viewModel.cultureEmoji, color: Color.cultureColor)

                    ProgressBar(civVariable: viewModel.science, civVariableCapacity: viewModel.scienceCapacity, geometryHeight: geometryHeight, geometryWidth: geometryWidth, emoji: viewModel.scienceEmoji, color: Color.scienceColor)
                    
                    ProgressBar(civVariable: viewModel.faith , civVariableCapacity: viewModel.faithCapacity, geometryHeight: geometryHeight, geometryWidth: geometryWidth, emoji: viewModel.faithEmoji, color: Color.faithColor)


            }
        )
    }
}

