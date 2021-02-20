//
//  BitCivNavigationView.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/17/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct BitCivNavigationView<Content: View>: View {
    let title: String
    let previous: Page
    let color : Color
    let content: Content
    
    let viewRouter: ViewRouter
    
    init(previous: Page, color : Color, title: String, viewRouter: ViewRouter, @ViewBuilder content: () -> Content) {
        self.title = title
        self.color = color
        self.previous = previous
        self.viewRouter = viewRouter
        self.content = content()
    }

        var body: some View {
            
            GeometryReader { geo in
            
                VStack {
                    
                    Rectangle()
                        .edgesIgnoringSafeArea(.top)
                        .frame(width: geo.size.width, height: geo.size.height / 15, alignment: .center)
                        .foregroundColor(color)
                        .overlay(
                            HStack {
                            
                                Button(action: {viewRouter.currentPage = previous}, label: {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.white)
                                })
                                
                                Text("\(title)").font(.title)
                                
                            }
                        )
                    
                    self.content
                }
            }
        }
    }
