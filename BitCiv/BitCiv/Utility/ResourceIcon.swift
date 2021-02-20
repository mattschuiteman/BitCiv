//
//  ResourceIcon.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 1/22/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

struct ResourceIcon: View {
    
    var circleWidth: CGFloat
    var circleHeight: CGFloat
    var color: Color
    var emoji: String
    
    var body: some View {
        Circle().frame(width: circleWidth, height:circleHeight).foregroundColor(color).opacity(0.3).overlay(Text(emoji))

    }
}


