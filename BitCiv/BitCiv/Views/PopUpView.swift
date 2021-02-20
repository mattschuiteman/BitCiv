//
//  PopUp.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 1/12/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct PopUpView: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    let message: String
    let optionMessages: [String]
    
    var body: some View {
        
        Rectangle().overlay(
            
            VStack {
                
                Text("\(message)")
                    .foregroundColor(Color.black)
                
                Spacer()
                
                ForEach(optionMessages, id: \.self) {text in
                    
                    Text(text).onTapGesture {
                        viewModel.togglePopUp()
                        viewModel.handlePopUp(text: text)
                    }
                    .foregroundColor(Color.black)
    
            
                }
                
            }
            .frame(width: 250, height: 175, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        )
        .foregroundColor(Color.white)
        .frame(width: 300, height: 200)
        .cornerRadius(20).shadow(radius: 20)
    }
}
