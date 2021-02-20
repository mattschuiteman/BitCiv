//
//  PopUp.swift
//  BitCiv
//
//  Created by Matthew Schuiteman on 2/7/21.
//  Copyright © 2021 Matthew Schuiteman. All rights reserved.
//

import Foundation

struct PopUp: Identifiable, Hashable {

    var id = UUID()
    
    let title: String
    
    let message: String
    
    let options: [String]
}
