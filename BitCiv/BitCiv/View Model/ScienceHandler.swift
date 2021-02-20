//
//  ScienceHandler.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 1/23/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

extension BitCivTextGame {
    
    func handleScience(title: String) {
        
        switch title {
        
        case "Wheel":
            resourceOperationsPerTurn(resource: "production", amount: 1)
            resourceOperationsPerTurn(resource: "science", amount: 1)
            resourceOperationsBulk(resource: "science",isSubtract: true, amount: 4)
        default:
            resourceOperationsBulk(resource: "faith", amount: 2)
        }
        
    }
    
}
