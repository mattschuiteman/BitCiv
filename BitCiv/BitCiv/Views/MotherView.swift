//
//  MotherView.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/5/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @ObservedObject var viewModel: BitCivTextGame
        
    var body: some View {
        
        switch viewRouter.currentPage {
        
        case .bitCivView:
            PopUpOption(viewModel: viewModel)
        
        case .navigationMenu:
            NavigationMenu(viewModel: viewModel)
                .transition(.slide)
            
        case .scienceView:
            ScienceMenu(viewModel: viewModel)
            
        case .militaryView:
            MilitaryView(viewModel: viewModel)
            
        case .workforceView:
            WorkforceView(viewModel: viewModel)
            
        default:
            PopUpOption(viewModel: viewModel)
        
        }
    }
}
    

