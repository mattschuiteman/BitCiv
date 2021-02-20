//
//  DisplayView.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/5/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct DisplayView: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    var geometryWidth: CGFloat
    var geometreyHeight: CGFloat
    
    var body: some View {
        
        ScrollView(.vertical) {
            
            ScrollViewReader {scrollProxy in
        
                ForEach(viewModel.console, id: \.self) {text in
                    
                    Group {
                        
                        if (text.contains("B.C.E.") || text.contains("C.E.")) {
                            Spacer()
                            
                            Text(text).bold()
                                .foregroundColor(.green)
                                .lineSpacing(25.0)
                            
                            Spacer()
                        }
                        
                        else if (text.hasSuffix(" Age")) {
                            Text(text)
                                .bold()
                                .foregroundColor(.blue)
                                .lineSpacing(50.0)
                                
                        }
                        
                        else {
                            Text(text)
                        }
                        
                    }
                    
                }.onChange(of: viewModel.console.count, perform: {_ in
                    scrollProxy.scrollTo(viewModel.console.count - 1, anchor: .bottom)
                })
                
            }
                
        }
        .padding()
        .frame(width: geometryWidth, alignment: .center)
    }
    
}
