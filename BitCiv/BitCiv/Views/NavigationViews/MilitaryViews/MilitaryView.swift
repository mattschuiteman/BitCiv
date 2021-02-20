//
//  MilitaryView.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/16/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct MilitaryView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @ObservedObject var viewModel: BitCivTextGame
    
    var body: some View {
        
        GeometryReader {geo in
            
            BitCivNavigationView(previous: .navigationMenu, color: Color.red, title: "Military", viewRouter: viewRouter) {
                
                VStack {
                
                    Text("\(viewModel.militaryOffensiveStrength) 💥")
                    
                    Text("\(viewModel.militaryDefensiveStrength) 🛡")
                    
                    ForEach(viewModel.arsenal, id: \.self) {unit in
                        
                        UnitView(unit: unit, geometryWidth: geo.size.width, geometryHeight: geo.size.height)
                        
                    }
                    
                }

            }
        }
            
    }
}
