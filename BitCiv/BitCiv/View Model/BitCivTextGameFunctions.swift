//
//  BitCivTextGameFunctions.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 1/15/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

extension BitCivTextGame {
    
    //MARK: - Functions
    
    func progress() {
        bitCivGame.progress()
        
        //popUpQueue(popUps: popUpArray)
    }
    
    //MARK: - Pop Up Functions
    
    func togglePopUp() {
        bitCivGame.togglePopUp()
    }
    
    func newPopUp(title: String, message: String, messages: [String]) -> PopUp {
        return PopUp(title: title, message: message, options: messages)
    }
    
    func popUpQueue(popUps: [PopUp]) {
        togglePopUp()
        popUpMessage = popUps[popUpQueueIndex].message
        popUpMessages = popUps[popUpQueueIndex].options
        popUpQueueIndex += 1
    }
    
    // MARK: - Resource Functions
    
    func resourceOperationsBulk(resource: String, isSubtract: Bool = false, amount: Int) {
        
        switch resource {
        
        case "currency":
            
            if !isSubtract {
                bitCivGame.currency = bitCivGame.currency + amount
            }
            
            else {
                bitCivGame.currency = bitCivGame.currency - amount
            }
            
        case "science":
            
            if !isSubtract {
                bitCivGame.science = bitCivGame.science + amount
            }
            
            else {
                bitCivGame.science = bitCivGame.science - amount
            }
            
        case "culture":
            
            if !isSubtract {
                bitCivGame.culture = bitCivGame.culture + amount
            }
            
            else {
                bitCivGame.culture = bitCivGame.culture - amount
            }
        case "faith":
            
            if !isSubtract {
                bitCivGame.faith = bitCivGame.faith + amount
            }
            
            else {
                bitCivGame.faith = bitCivGame.faith - amount
            }
            
        case "production":
            
            if !isSubtract {
                bitCivGame.production = bitCivGame.production + amount
            }
            
            else {
                bitCivGame.production = bitCivGame.production - amount
            }
            
        default:
            print("\(resource) not found")
        }
    }
    
    func resourceOperationsPerTurn(resource: String, isSubtract: Bool = false, amount: Int) {
        
        switch resource {
        
        case "currency":
            
            if !isSubtract {
                bitCivGame.currencyPerTurn = bitCivGame.currencyPerTurn + amount
            }
            
            else {
                bitCivGame.currencyPerTurn = bitCivGame.currencyPerTurn - amount
            }
            
        case "science":
            
            if !isSubtract {
                bitCivGame.sciencePerTurn = bitCivGame.sciencePerTurn + amount
            }
            
            else {
                bitCivGame.sciencePerTurn = bitCivGame.sciencePerTurn - amount
            }
            
        case "culture":
            
            if !isSubtract {
                bitCivGame.culturePerTurn = bitCivGame.culturePerTurn + amount
            }
            
            else {
                bitCivGame.culturePerTurn = bitCivGame.culturePerTurn - amount
            }
        case "faith":
            
            if !isSubtract {
                bitCivGame.faithPerTurn = bitCivGame.faithPerTurn + amount
            }
            
            else {
                bitCivGame.faithPerTurn = bitCivGame.faithPerTurn - amount
            }
            
        case "production":
            
            if !isSubtract {
                bitCivGame.productionPerTurn = bitCivGame.productionPerTurn + amount
            }
            
            else {
                bitCivGame.productionPerTurn = bitCivGame.productionPerTurn - amount
            }
            
        default:
            print("\(resource) not found")
        }


    }
    
    // MARK: - Military Functions
    
    func attack(unit: Unit, destination: Civ, randomOffset: Int = 5) {
        
        let offensiveStrength = unit.offensiveStrength
        
        var attackStrength = randomAttackGenerator(floor: offensiveStrength - randomOffset, ceiling: offensiveStrength + randomOffset)
        
        if hasProduced.ancientWalls {
            attackStrength -= 10
        }
        
        else if hasProduced.classicalWalls {
            attackStrength -= 20
        }
        
        else if hasProduced.medievalWalls {
            attackStrength -= 40
        }
        
        bitCivGame.civs[bitCivGame.civs.firstIndex(of: destination)!].health -= attackStrength
        
    }
    
    func randomAttackGenerator(floor: Int, ceiling: Int) -> Int {
        return Int.random(in: floor..<ceiling)
    }
    
    
}
