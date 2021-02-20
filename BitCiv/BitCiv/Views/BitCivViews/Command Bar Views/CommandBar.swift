//
//  CommandBar.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/5/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct CommandBar: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel: BitCivTextGame
    
    @State var isShowingScienceMenu: Bool = false
    @State var isShowingCultureMenu: Bool = false
    @State var isShowingHappinessMenu: Bool = false
    @State var isShowingNavigationMenu: Bool = false
    
    let geometryWidth: CGFloat
    
    let geometryHeight: CGFloat
    
    var viewWidth: CGFloat {
        geometryWidth
    }
    
    var viewHeight: CGFloat {
        geometryHeight / 10
    }
    
    var body: some View {
        
        HStack(spacing: 1) {
            
            Button(action: {isShowingHappinessMenu.toggle()}, label: {
                
                HappinessMenuButton(viewModel: viewModel, geometryWidth: geometryWidth, geometryHeight: geometryHeight)
                
            }).popover(isPresented: $isShowingHappinessMenu, content: {
                HappinessMenu(viewModel: viewModel)
            })
                
            Button(action: {isShowingScienceMenu.toggle()}, label: {
                
                MenuButton(emoji: viewModel.scienceEmoji, color: Color.scienceColor, geometryWidth: geometryWidth, geometryHeight: geometryHeight)
                
            }).popover(isPresented: $isShowingScienceMenu, content: {
                ScienceMenu(viewModel: viewModel)
            })
            
            Rectangle()
                .overlay(
                    ProgressButton(viewModel: viewModel, geometryWidth: viewWidth, geometryHeight: viewHeight)

                )
                .foregroundColor(Color.white)
                .frame(width: viewWidth / 4)
                
            
            Button(action: {isShowingCultureMenu.toggle()}, label: {
                
                MenuButton(emoji: viewModel.cultureEmoji, color: Color.cultureColor, geometryWidth: geometryWidth, geometryHeight: geometryHeight)
                
            })
            
            Button(action: {
                isShowingNavigationMenu.toggle()
                viewRouter.currentPage = .navigationMenu
            }, label: {
                
                MenuButton(emoji: "➡︎", color: Color.homeButtonColor, geometryWidth: geometryWidth, geometryHeight: geometryHeight)
                
            })
                
                
        }
        .frame(width: viewWidth, height: viewHeight, alignment: .center)
        
    }
}
