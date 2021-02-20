//
//  ContentView.swift
//  CustomNavigationView
//
//  Created by Sarah Alsharif on 9/12/20.
//  Copyright © 2020 Sarah Alsharif. All rights reserved.
//

import SwiftUI

struct NavigationMenu: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @ObservedObject var viewModel: BitCivTextGame
    
    @State var militaryUnlocked: Bool = true
    @State var workforceUnlocked: Bool = true
    
    var buildableUnits = ["Warrior"]
    
    var body: some View {
        
        GeometryReader { geo in
            
            BitCivNavigationView(previous: .noPage, color: Color.blue, title: "Actions", viewRouter: viewRouter) {
                
                VStack {
                
                    ZStack {
                        
                        ScrollView {
                        
                            VStack(spacing: 0) {
                                
                                if militaryUnlocked {
                                    Button(action: {viewRouter.currentPage = .militaryView}, label: {
                                        Rectangle().stroke(lineWidth: 2.0).foregroundColor(.black)
                                            .overlay(Text("Military 🪖").font(.title).foregroundColor(.black))
                                            .frame(width: geo.size.width, height: geo.size.height / 10)

                                    })
                                    
                                }
                                
                                if workforceUnlocked {
                                    Button(action: {viewRouter.currentPage = .workforceView}, label: {
                                        Rectangle().stroke(lineWidth: 2.0).foregroundColor(.black)
                                            .overlay(Text("Workforce ⚒️").font(.title).foregroundColor(.black))
                                            .frame(width: geo.size.width, height: geo.size.height / 10)

                                    })

                                }
                            }
                        }
                        
                    }
                }
                
            }
        }
    }
}
