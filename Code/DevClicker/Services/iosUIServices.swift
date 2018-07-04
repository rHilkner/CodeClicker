//
//  UIServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 29/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

struct IosUIServices: UIServicesProtocol {

    /// Represents the LoC quantity into a string in the format: "XXX.XXX k" or "XXX.XXX M" or "XXX.XXX B"
    static func locStringFormat(loc: Int) -> String {
        var locString = "\(loc)"
        let locValue = loc

        // If value is greater than thousands, then it needs formatting
        if locValue >= 1000 {
            let locValueString = self.valueToString(value: locValue, spaced: true)
            locString = locValueString
        }

        return locString
    }

    /// Represents the LoC quantity into a string in the format: "D$ XXX.XXX k" or "D$ XXX.XXX M"
    static func dolStringFormat(dol: Double) -> String {
        var dolString = String(format: "D$ %.2f", dol)
        let dolValue = Int(dol)

        // If value is greater than thousands, then it needs formatting
        if dolValue >= 1000 {
            let dolValueString = self.valueToString(value: dolValue, spaced: true)
            dolString = "D$ " + dolValueString
        }

        return dolString
    }

}
