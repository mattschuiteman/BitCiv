//
//  Color.swift
//  Breezy
//
//  Created by Matthew Schuiteman on 10/11/20.
//

import SwiftUI

extension Color {
    static var citizenColorMax:      Color { .rgb(255, 215, 000) }
    static var citizenColorGood:     Color { .rgb(077, 139, 049) }
    static var citizenColorBad:      Color { .rgb(255, 136, 017)}
    static var citizenColorMiddle:   Color { .rgb(234, 214, 055)}
    static var citizenColorHorrible: Color  { .rgb(242, 027, 063)}
    
    static var homeButtonColor: Color {.rgb(107, 162, 146)}
    
    
    static var tartOrange:    Color { .rgb(254, 074, 073) }
    static var burgundy:        Color { .rgb(108, 14, 35)     }
 
    
    
    static var cultureColor:      Color { .rgb(115, 0, 113)}
    static var currencyColor:      Color { .rgb(234, 214, 055)}
    static var scienceColor:      Color { .rgb(074, 111, 165)}
    static var productionColor:      Color { .rgb(255, 136, 017)}
    static var faithColor:            Color {.rgb(238, 171, 196)}
}

extension Color {
    static func rgb(_ red: UInt8, _ green: UInt8, _ blue: UInt8) -> Color {
        func value(_ raw: UInt8) -> Double {
            return Double(raw)/Double(255)
        }
        return Color(
            red: value(red),
            green: value(green),
            blue: value(blue)
        )
    }
}
