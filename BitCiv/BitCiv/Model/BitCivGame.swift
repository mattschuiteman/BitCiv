//
//  BitCivGame.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 9/13/20.
//  Copyright © 2020 Matthew Schuiteman. All rights reserved.
//

import Foundation

struct BitCivGame {
    
    //MARK: - User Customizable Variables
    let civName: String
    let civDenonym: String
    let civCurrency: String
    
    let civBackstory: String
    
    //MARK: - Time & Era Variables
    var year: Int = 5000
    var isCE: Bool = false
    var notation: String { isCE ? "C.E." : "B.C.E."}
    
    var age: String = "Prehistoric"
    
    //MARK: - Array of Civs
    
    var civs: [Civ]
    
    //MARK: - Civ Resource Variables
    var currency: Int = 0
    var production: Int = 0
    var culture: Int = 0
    var science: Int = 0
    var faith: Int = 0
    
    var food: Int = 300
    var population: Int = 100
    
    //MARK: - Civ Vars Per Turn
    
    var currencyPerTurn: Int = 1
    var productionPerTurn: Int = 1
    var culturePerTurn: Int = 1
    var sciencePerTurn: Int = 1
    var faithPerTurn: Int = 1
    
    var foodPerTurn: Int = 100
    
    //MARK: - Civ Var Capacity
    var currencyCapacity: Int = 10
    var productionCapacity: Int = 10
    var cultureCapacity: Int = 10
    var scienceCapacity: Int = 10
    var faithCapacity: Int = 10
    
    //MARK: - Citizen Vars
    var citizenHappiness: Int {
        (policeHappiness + armyHappiness + eliteHappiness + peopleHappiness + oppositionHappiness) / 5
    }
    
    let citizenHappinessCap = 100
    
    var policeHappiness = 90
    var armyHappiness = 90
    var eliteHappiness = 90
    var peopleHappiness = 90
    var oppositionHappiness = 90
    
    //MARK: - Strategic Variables
    
    
    
    //MARK: - War Variables
    var atWar: Bool = false
    
    var arsenal: [Unit] = [Unit(type: .warrior), Unit(type: .archer)]
    
    var militaryOffensiveStrength: Int {
        
        var strength: Int = 0
        
        for index in arsenal {
            strength += index.offensiveStrength
        }
        
        return strength
    }
    
    var militaryDefensiveStrength: Int {
        
        var strength: Int = 0
        
        for index in arsenal {
            strength += index.defensiveStrength
        }
        
        return strength
    }
    
    //Game variables
    var console: [String] = ["Welcome to BitCiv!"]
    
    var showPopUp: Bool = false
    var popUpMessage: String = ""
    var popUpMessages: [String] = [""]
    var popUpOptionsCount: Int {
        popUpMessages.count
    }

    //MARK: - Functions
    
    mutating func progress() {
        
        updateTimeAndEra()
        
        updateCivVariables()
        
        updateFood()
        
        console.append("Year: \(year) \(notation)")
        
    }
    
    mutating func togglePopUp() {
        showPopUp = !showPopUp
    }
    
    //MARK: - Update Civ Variables
    
    mutating func updateCivVariables() {
        
        updateHappiness()
        
        if (currency < currencyCapacity) {
            
            currency = currency + currencyPerTurn
            
            if (currency > currencyCapacity) {
                
                let extraCurrency = currency - currencyCapacity
                
                currency = currency - extraCurrency
            }
        }
        
        if (production < productionCapacity) {
            
            production = production + productionPerTurn
            
            if (production > productionCapacity) {
                
                let extraProduction = production - productionCapacity
                
                production = production - extraProduction
            }
        }
        
        if (science < scienceCapacity) {
            
            science = science + sciencePerTurn
            
            if (science > scienceCapacity) {
                
                let extraScience = science - scienceCapacity
                
                science = science - extraScience
            }
        }
        
        if (culture < cultureCapacity) {
            
            culture = culture + culturePerTurn
            
            if (culture > cultureCapacity) {
                
                let extraCulture = culture - cultureCapacity
                
                culture = culture - extraCulture
            }
        }
        
        if (faith < faithCapacity) {
            
            faith = faith + faithPerTurn
            
            if (faith > faithCapacity) {
                
                let extraFaith = faith - faithCapacity
                
                faith = faith - extraFaith
            }
        }
    }
    
    mutating func updateFood() {
        
        if citizenHappiness > 90 {
            foodPerTurn = population * 3
            foodPerTurn = foodPerTurn - (militaryOffensiveStrength * 3)
        }
        
    }
    
    //MARK: - updateHappiness()
    
    mutating func updateHappiness() {
        
        policeHappiness += 1
        eliteHappiness += 1
        peopleHappiness += 1
        oppositionHappiness += 1
        armyHappiness += 1
        
    }
    
    //MARK: - updateTimeAndEra
    
    mutating func updateTimeAndEra() {
        
        //Update Year
        
        if (year == 0) {
            isCE = true
        }
        
        if (isCE && age == "Modern Age") {
            year = year + 25
        }
        
        if (isCE && age == "Information Age") {
            year = year + 10
        }
        
        if (isCE && age == "Medieval Age") {
            year = year + 50
        }
        
        if (isCE && age == "Technological Singularity") {
            year = year + 1
        }
        
        if (age == "Classical Age" && isCE) {
            year = year + 100
        }
        
        if (!isCE) {
            year = year - 100
        }
        
        //Update Age
        
        let oldAge = age
        
        if (!isCE && year <= 5000 && year > 3500) {
            age = "Stone Age"
        }
        
        if (year <= 3500 && year > 800 && !isCE) {
            age = "Iron Age"
        }
        
        else if (!isCE && year <= 800) {
            age = "Classical Age"
        }
        
        else if (isCE && year >= 0 && year < 900) {
            age = "Classical Age"
        }
        
        else if (isCE && year >= 900 && year < 1400) {
            age = "Medieval Age"
        }
        
        else if (isCE && year >= 1400 && year < 1950) {
            age = "Modern Age"
        }
        
        else if (isCE && year >= 1950 && year < 2050) {
            age = "Information Age"
        }
        
        else if (isCE && year <= 2050) {
            age = "Technological Singularity"
        }
        
        if !(oldAge == age) {
            console.append("You have entered the \(age)")
        }
        
    }
    
    mutating func buildUnit(name: String, cost: Int, method: String) {
        if name == "Warrior" {
            
            if method == "currency" {
                
                currency -= cost
                arsenal.append(Unit(type: .warrior))
            }
        }
        
        else {
            arsenal.append(Unit(type: .warrior))
        }
    }
    
    init(civName: String, civDenonym: String, civCurrency: String, civBackstory: String) {
        self.civName = civName
        self.civDenonym = civDenonym
        self.civCurrency = civCurrency
        self.civBackstory = civBackstory
        
        civs = [
            Civ(name: "Greece", demonym: "Greek", health: 100, morale: 80, militaryOffensiveStrength: 50, militaryDefensiveStrength: 50, arsenal: [Unit(type: .warrior)])
        ]
        
    }
}

