//
//  PopUpHandler.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 1/18/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import SwiftUI

extension BitCivTextGame {
    
    func handlePopUp(text: String) {
        
        switch text {
        
        case "Dismiss":
            print("Dismiss")
        
        case "Build Marketplace":
            resourceOperationsBulk(resource: "currency", amount: 2)
            
        case "Build Observatory":
            resourceOperationsBulk(resource: "science", amount: 2)
            
        default:
            resourceOperationsBulk(resource: "faith", amount: 2)
        }
        
        // If there are more popUps to be handled, execute. Otherwise, terminate the array and restart the index
        
        if popUpQueueIndex < popUpArray.count {
            popUpQueue(popUps: popUpArray)
        }
        else {
            popUpArray.removeAll()
            popUpQueueIndex = 0
        }
        
    }
    
}
