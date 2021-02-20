//
//  WorkforceView.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/3/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct WorkforceView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @ObservedObject var viewModel: BitCivTextGame
    
    var meeples: [String] = ["👤", "👤", "👤", "👤"]
    
    
    var body: some View {
        
        BitCivNavigationView(previous: .navigationMenu, color: Color.purple, title: "Workforce", viewRouter: viewRouter) {
            
            VStack {
                
                HStack {
                    
                    ScrollView(.horizontal) {
                    
                        ForEach(meeples, id: \.self) {meeple in
                            
                            Text("\(meeple)")
                            
                        }
                        
                    }
                    
                }
            }
        }
    }
}

