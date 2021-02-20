//
//  HappinessMenu.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 12/16/20.
//  Copyright © 2020 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct HappinessMenu: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    var body: some View {
        
        GeometryReader {geometry in
            
            VStack(spacing: 40) {
                
                HStack(spacing: 100) {
                    
                    TotalCircle(viewModel: viewModel, emoji: viewModel.oppositionEmoji, happinessVar: viewModel.oppositionHappiness, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                    
                    TotalCircle(viewModel: viewModel, emoji: viewModel.peopleEmoji, happinessVar: viewModel.peopleHappiness, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                    
                    TotalCircle(viewModel: viewModel, emoji: viewModel.eliteEmoji, happinessVar: viewModel.eliteHappines, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                    
                }
                
                HStack(spacing: 100) {
                    
                    TotalCircle(viewModel: viewModel, emoji: viewModel.policeEmoji, happinessVar: viewModel.policeHappiness, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                    
                    TotalCircle(viewModel: viewModel, emoji: viewModel.armyEmoji, happinessVar: viewModel.armyHappiness, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                    
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height / 3, alignment: .center)
            
        }
            
    }
}

struct TotalCircle: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    var emoji: String
    var happinessVar: Int
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var viewHeight: CGFloat {
        geometryHeight / 10
    }
    var viewWidth: CGFloat {
        geometryWidth / 10
    }
    
    var body: some View {
        
        ZStack {
            
            Group {
            
                Circle()
                    .stroke(viewModel.happinessColor, lineWidth: lineWidth)
                    .opacity(0.1)
                    //.frame(width: viewWidth, height: viewHeight, alignment: .center)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(viewModel.citizenHappiness) / 100 )
                    .stroke(viewModel.happinessColor, lineWidth: lineWidth)
                    //.frame(width: viewWidth, height: viewHeight, alignment: .center)
                    .rotationEffect(.degrees(-90))
                    .overlay(
                        EmojiCircle(emoji: emoji)
                    )
                    
            }
            
        }
        .frame(width: viewWidth, height: viewHeight, alignment: .center)
        
    }
    
    let lineWidth: CGFloat = 80
}

struct EmojiCircle : View {
    
    let emoji: String
    
    var body: some View {
        
        Circle().foregroundColor(.white)
            .overlay(Text(emoji))
        
    }
}


struct HappinessMenu_Previews: PreviewProvider {
    static var previews: some View {
        HappinessMenu(viewModel: BitCivTextGame.init(civName: "Hello", civDenonym: "Goodybe", civCurrency: "bitcoin", civBackstory: "Suffering Pilgrim"))
    }
}
