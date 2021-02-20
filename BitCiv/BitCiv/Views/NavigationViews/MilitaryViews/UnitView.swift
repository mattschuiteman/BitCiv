//
//  UnitView.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/17/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct UnitView: View {
    
    var unit: Unit
    
    var geometryWidth: CGFloat
    var geometryHeight: CGFloat
    
    var viewWidth: CGFloat {
        geometryWidth / 20
    }
    var viewHeight: CGFloat {
        geometryHeight / 20
    }
    
    var body: some View {
        
        HStack {
            
            Text("\(unit.name)")
            
            ZStack(alignment: .leading) {
            
                Capsule().frame(width: viewWidth, height: viewHeight, alignment: .leading).opacity(0.3).foregroundColor(Color.red)
                
                Capsule().frame(width: CGFloat( Double(unit.health) / Double(unit.maxHealth) ) * viewWidth , height: viewHeight, alignment: .leading)
                    .animation(.linear)
                    .foregroundColor(Color.red)
                    .overlay(
                        Text("\(unit.health)").foregroundColor(Color.white))
                
            }
            
            Text("💥 \(unit.offensiveStrength)")
            
            Text("🛡 \(unit.defensiveStrength)")
            
        }
    }
}
