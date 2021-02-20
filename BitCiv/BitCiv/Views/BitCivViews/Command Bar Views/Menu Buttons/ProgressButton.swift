//
//  ProgressButton.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/5/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct ProgressButton: View {
    
    @ObservedObject var viewModel: BitCivTextGame
    
    var geometryWidth: CGFloat
    
    var geometryHeight: CGFloat
    
    var viewWidth: CGFloat {
        geometryWidth * 2
    }
    
    var viewHeight: CGFloat {
        geometryHeight * 2
    }
    
    var crossHeight: CGFloat {
        viewHeight / crossHeightDivisor
    }
    
    var crossWidth: CGFloat {
        viewWidth / crossWidthDivisor
    }
    
    var body: some View {
        
        Button(action: viewModel.progress) {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .shadow(radius: 5)
                .overlay(

                //Plus Marks
                Group {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: crossWidth, height: crossHeight, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: crossHeight, height: crossWidth, alignment: .center)
                        )
                        .foregroundColor(Color.white)
                        .fixedSize()
                        .padding()
                    
                    Text("Progress")
                        .font(.system(size: 15, weight: .heavy, design: .default))
                        .foregroundColor(Color.white)
                        
                    
                }
        
            )
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(Color.green)
                
        
        }
    }
    
    let cornerRadius: CGFloat = 15.0
    let crossHeightDivisor: CGFloat = 28
    let crossWidthDivisor: CGFloat = 18
    
}
