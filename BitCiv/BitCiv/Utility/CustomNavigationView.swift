//
//  CustomNavigationView.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/5/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct CustomNavigationView<Content: View, Destination: View>: View {
    let title: String
    let destination : Destination
    let color : Color
    let content: Content
    @State var active = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(destination: Destination, color : Color, title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.destination = destination
        self.color = color
        self.content = content()
    }

        var body: some View {
            NavigationView {
                GeometryReader { geometry in
                    Color.white
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(color)
                            
                            Text(title)
                                .foregroundColor(.white)
                                .padding([.leading,.trailing], 8)
                                .frame(width: geometry.size.width)
                                .font(.system(size: 22))
                
                        }
                        .frame(width: geometry.size.width, height: 90)
                        .edgesIgnoringSafeArea(.top)

                        Spacer()
                        self.content
//                            .padding()
//                            .background(color.opacity(0.3))
//                            .cornerRadius(20)
                        Spacer()
                    }
                }.navigationBarHidden(true)
            }
        }
    }

