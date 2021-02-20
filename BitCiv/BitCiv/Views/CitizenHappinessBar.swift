//
//  CitizenHappinessBar.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 12/13/20.
//  Copyright © 2020 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct CitizenHappinessBar: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    let emoji: String
    let citizenHappiness: Int
    
    var geometryHeight: CGFloat
    var geometryWidth: CGFloat
    
    var color: Color {
        
        if (viewModel.citizenHappiness >= 95) {
            return Color.citizenColorMax
        }
        
        else if (viewModel.citizenHappiness < 95 && viewModel.citizenHappiness >= 75 ) {
            return Color.citizenColorGood
        }
        
        else if (viewModel.citizenHappiness < 75 && viewModel.citizenHappiness >= 50) {
            return Color.citizenColorMiddle
        }
        
        else if (viewModel.citizenHappiness < 50 && viewModel.citizenHappiness >= 35) {
            return Color.citizenColorBad
        }
        
        else {
            return Color.citizenColorHorrible
        }
    }
    
    var viewHeight: CGFloat {
        geometryHeight / 48
    }
    
    var viewWidth: CGFloat {
        geometryWidth - (geometryWidth / 3)
    }
    
    var circleHeight: CGFloat {
        geometryHeight / 16
    }
    
    var circleWidth: CGFloat {
        geometryWidth / 16
    }
    
    var body: some View {
        
        HStack {
            
            ZStack(alignment: .leading) {
            
                Capsule().frame(width: viewWidth, height: viewHeight, alignment: .leading).opacity(0.3).foregroundColor(color)
                
                Capsule().frame(width: CGFloat(Double(citizenHappiness) / Double(100)) * viewWidth , height: viewHeight, alignment: .leading).animation(.linear).foregroundColor(color)
                
            }
            
            Circle().frame(width: circleWidth, height:circleHeight).foregroundColor(color).opacity(0.3).overlay(Text(emoji))
            
        }
        
    }
}

