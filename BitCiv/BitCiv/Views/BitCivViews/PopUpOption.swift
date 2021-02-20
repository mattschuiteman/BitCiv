//
//  ContentView.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 9/13/20.
//  Copyright © 2020 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct PopUpOption: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @ObservedObject var viewModel: BitCivTextGame
    
    var body: some View {
        
        ZStack {
            
            if viewModel.showPopUp {
                
                BitCivView(viewModel: viewModel)
                    .overlay(Rectangle().ignoresSafeArea().opacity(0.3))
                    .overlay(
                        PopUpView(viewModel: viewModel, message: viewModel.popUpMessage, optionMessages: viewModel.popUpMessages)
                    )
                
            }
            
            else {
                
                BitCivView(viewModel: viewModel)

            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BitCivView(viewModel: BitCivTextGame.init(civName: "Greece", civDenonym: "Greek", civCurrency: "bitcoin", civBackstory: "Suffering Pilgrim"))
    }
}
