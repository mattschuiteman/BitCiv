//
//  BitCivTextGameViews.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 1/23/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

extension BitCivTextGame {
    
    //Icons
    
    var cultureIcon: some View {
        Circle().foregroundColor(Color.cultureColor).opacity(0.3).overlay(Text("🎵"))
    }
    
    var scienceIcon: some View {
        Circle().foregroundColor(Color.scienceColor).opacity(0.3).overlay(Text("🔬"))
    }
    
    var productionIcon: some View {
        Circle().foregroundColor(Color.productionColor).opacity(0.3).overlay(Text("⚙️"))
    }
    
    var currencyIcon: some View {
        Circle().foregroundColor(Color.currencyColor).opacity(0.3).overlay(Text("💰"))
    }
    
    var faithIcon: some View {
        Circle().foregroundColor(Color.faithColor).opacity(0.3).overlay(Text("🙏🏼"))
    }
}
