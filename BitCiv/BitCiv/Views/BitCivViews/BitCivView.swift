//
//  BitCivView.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/5/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct BitCivView: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    var body: some View {
        
        GeometryReader {geometry in
        
            VStack {
                
                TitleBar(viewModel: viewModel, geometryHeight: geometry.size.height, geometryWidth:geometry.size.width)
                
                DisplayView(viewModel: viewModel, geometryWidth: geometry.size.width, geometreyHeight: geometry.size.height)
                
                
                CommandBar(viewModel: viewModel,geometryWidth: geometry.size.width, geometryHeight: geometry.size.height)
                    .scaledToFit()
                
                Spacer()
                
                DataView(viewModel: viewModel, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                    
            }
        }
    }
}
