//
//  Unit.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/17/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import Foundation

struct Unit: Hashable, Equatable {
    
    enum type {
        case warrior, archer, chariot
    }
    
    var name: String = ""
    var health: Int = 0
    var maxHealth: Int = 0
    
    var cost: Int = 0
    
    var offensiveStrength: Int = 0
    var defensiveStrength: Int = 0
    
    init(type: type) {
        
        if type == .warrior {
            name = "Warrior"
            health = 15
            maxHealth = 15
            cost = 10
            offensiveStrength = 20
            defensiveStrength = 20
        }
        
        if type == .archer {
            name = "Archer"
            health = 10
            maxHealth = 10
            cost = 15
            offensiveStrength = 10
            defensiveStrength = 20
        }
        
        if type == .chariot {
            name = "Chariot"
            health = 20
            maxHealth = 20
            cost = 25
            offensiveStrength = 30
            defensiveStrength = 20
        }
    }
    
}
