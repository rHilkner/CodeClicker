//
//  UIServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 29/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class UIServices {

    /// Represents the LoC quantity into a string in the format: "D$ XXX.XXX k" or "D$ XXX.XXX M"
    static func locStringFormat(loc: Int) -> String {
        var locString = "\(loc) LoC"
        let locValue = loc

        // If value is greater than thousands, then it needs formatting
        if locValue >= 1000 {
            let locValueString = self.valueToString(value: locValue)
            locString = locValueString + " LoC"
        }

        return locString
    }

    /// Represents the LoC quantity into a string in the format: "D$ XXX.XXX k" or "D$ XXX.XXX M"
    static func dolStringFormat(dol: Double) -> String {
        var dolString = String(format: "D$ %.2f", dol)
        let dolValue = Int(dol)

        // If value is greater than thousands, then it needs formatting
        if dolValue >= 1000 {
            let dolValueString = self.valueToString(value: dolValue)
            dolString = "D$ " + dolValueString
        }

        return dolString
    }

    private static func valueToString(value: Int) -> String {
        var num = value
        var valueString: String = ""

        // Checking billion
        if num >= (1000)^^3 {
            let valueRemained = (value%(1000)^^3)/(1000^^2)
            num /= (1000)^^3
            valueString = "\(num).\(valueRemained) B"

            // Checking million
        } else if num >= (1000)^^2 {
            let valueRemained = (num%(1000)^^2)/1000
            num /= (1000)^^2
            valueString = "\(num).\(valueRemained) M"

            // Checking thousand
        } else if num >= 1000 {
            let valueRemained = num%1000
            num /= 1000
            valueString = "\(num).\(valueRemained) k"
        }

        return valueString
    }

}
