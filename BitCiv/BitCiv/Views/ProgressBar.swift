//
//  ProgressBar.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 12/10/20.
//  Copyright © 2020 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    
    let civVariable: Int
    let civVariableCapacity: Int
    
    let geometryHeight: CGFloat
    let geometryWidth: CGFloat
    
    var viewHeight: CGFloat {
        geometryHeight / 55
    }
    
    var viewWidth: CGFloat {
        geometryWidth - (geometryWidth / 3)
    }
    
    var circleHeight: CGFloat {
        geometryHeight / 16
    }
    
    var circleWidth: CGFloat {
        geometryWidth / 16
    }
    
    let emoji: String
    
    let color: Color
    
    var body: some View {
        
        HStack {
            
            ZStack(alignment: .leading) {
            
                Capsule().frame(width: viewWidth, height: viewHeight, alignment: .leading).opacity(0.3).foregroundColor(color)
                
                Capsule().frame(width: CGFloat( Double(civVariable) / Double(civVariableCapacity) ) * viewWidth , height: viewHeight, alignment: .leading)
                    .animation(.linear)
                    .foregroundColor(color)
                    .overlay(
                        Text("\(civVariable)").foregroundColor(Color.white))
                
            }
            
            ResourceIcon(circleWidth: circleWidth, circleHeight: circleHeight, color: color, emoji: emoji)
            
        }
        
    }
}
