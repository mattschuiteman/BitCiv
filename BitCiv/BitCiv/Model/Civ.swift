//
//  Civ.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/16/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import Foundation

struct Civ: Hashable {
    
    let name: String
    let demonym: String
    
    var health: Int
    
    var morale: Int
    
    var militaryOffensiveStrength: Int
    var militaryDefensiveStrength: Int
    
    var arsenal: [Unit]
}
