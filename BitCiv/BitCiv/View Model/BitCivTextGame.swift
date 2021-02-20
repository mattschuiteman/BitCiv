//
//  BitCivEmojiGame.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 10/1/20.
//  Copyright © 2020 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

class BitCivTextGame: ObservableObject {
    
    @Published var bitCivGame: BitCivGame
    
    @Published var hasProduced: hasProduced
    
    init(civName: String, civDenonym: String, civCurrency: String, civBackstory: String) {
        
        bitCivGame = .init(civName: civName, civDenonym: civDenonym, civCurrency: civCurrency, civBackstory: civBackstory)
        
        hasProduced = .init()
    }
    
    //MARK: - Emojis
    
    // Variables
    
    let cultureEmoji = "🎵"
    let scienceEmoji = "🔬"
    let productionEmoji = "⚙️"
    let currencyEmoji = "💰"
    let faithEmoji = "🙏🏼"
    
    // Happiness Emoji / Color
    
    let armyEmoji = "💂🏻"
    let peopleEmoji = "👩🏼‍🏭"
    let eliteEmoji = "🤵🏽"
    let policeEmoji = "👮🏿‍♂️"
    let oppositionEmoji = "👨🏽‍🎨"
    
    var happinessEmoji: String {
        
        if (bitCivGame.citizenHappiness >= 95) {
            return "😍"
        }
        
        else if (bitCivGame.citizenHappiness < 95 && bitCivGame.citizenHappiness >= 75 ) {
            return "😄"
        }
        
        else if (bitCivGame.citizenHappiness < 75 && bitCivGame.citizenHappiness >= 50) {
            return "🙂"
        }
        
        else if (bitCivGame.citizenHappiness < 50 && bitCivGame.citizenHappiness >= 35) {
            return "🙁"
        }
        
        else {
            return "😡"
        }
        
    }
    
    var happinessColor: Color {
    
        if (bitCivGame.citizenHappiness >= 95) {
            return Color.citizenColorMax
        }
        
        else if (bitCivGame.citizenHappiness < 95 && bitCivGame.citizenHappiness >= 75 ) {
            return Color.citizenColorGood
        }
        
        else if (bitCivGame.citizenHappiness < 75 && bitCivGame.citizenHappiness >= 50) {
            return Color.citizenColorMiddle
        }
        
        else if (bitCivGame.citizenHappiness < 50 && bitCivGame.citizenHappiness >= 35) {
            return Color.citizenColorBad
        }
        
        else {
            return Color.citizenColorHorrible
        }
    }
    
    var eliteHappines: Int {
        bitCivGame.eliteHappiness
    }
    
    var armyHappiness: Int {
        bitCivGame.armyHappiness
    }
    
    var peopleHappiness: Int {
        bitCivGame.peopleHappiness
    }
    
    var policeHappiness: Int {
        bitCivGame.policeHappiness
    }
    
    var oppositionHappiness: Int {
        bitCivGame.oppositionHappiness
    }
    
    
    //MARK: - Game Variables
    
    var console: [String] {
        bitCivGame.console
    }
    
    // Pop Up
    
    var showPopUp: Bool {
        bitCivGame.showPopUp
    }
    
    var popUpMessage: String = ""
    
    var popUpMessages: [String] = []
    
    var popUpArray: [PopUp] = []
    
    var popUpQueueIndex: Int = 0
    
     
    //MARK:- Time / Era Variables
    
    var year: Int {
        bitCivGame.year
    }
    
    var notation: String {
        bitCivGame.notation
    }
    
    var age: String {
        bitCivGame.age
    }
    
    //MARK: - Military Variable Access
    
    var arsenal: [Unit] {
        bitCivGame.arsenal
    }
    
    var militaryOffensiveStrength: Int {
        bitCivGame.militaryOffensiveStrength
    }
    
    var militaryDefensiveStrength: Int {
        bitCivGame.militaryDefensiveStrength
    }
    
    
    //MARK: - Civ Variable Access
    
    var citizenHappiness: Int {
        bitCivGame.citizenHappiness
    }
    
    var currency: Int {
        bitCivGame.currency
    }
    
    var currencyCapacity: Int {
        bitCivGame.currencyCapacity
    }
    
    var production: Int {
        bitCivGame.production
    }
    
    var productionCapacity: Int {
        bitCivGame.productionCapacity
    }
    
    var culture: Int {
        bitCivGame.culture
    }
    
    var cultureCapacity: Int {
        bitCivGame.cultureCapacity
    }
    
    var science: Int {
        bitCivGame.science
    }
    
    var scienceCapacity: Int {
        bitCivGame.scienceCapacity
    }
    
    var faith: Int {
        bitCivGame.faith
    }
    
    var faithCapacity: Int {
        bitCivGame.faithCapacity
    }
    
}
