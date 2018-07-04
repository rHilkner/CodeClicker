//
//  UIServicesProtocol.swift
//  DevClicker
//
//  Created by Mauricio Lorenzetti on 04/07/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

protocol UIServicesProtocol {
    static func locStringFormat(loc: Int) -> String
    static func dolStringFormat(dol: Double) -> String
    static func valueToString(value: Int, spaced: Bool) -> String
}

extension UIServicesProtocol {

    /// Returns the string from the given value in the string format: "XXX.XXX_y", in which y = {k, M, B}, _ = spaced
    static func valueToString(value: Int, spaced: Bool) -> String {
        var num = value
        var valueRemained: Int = 0
        var valueString: String = ""
        var sufixString: String = ""

        // Checking billion
        if num >= (1000)^^3 {
            valueRemained = (value%(1000)^^3)/(1000^^2)
            num /= (1000)^^3
            sufixString = "B"

            // Checking million
        } else if num >= (1000)^^2 {
            valueRemained = (num%(1000)^^2)/1000
            num /= (1000)^^2
            sufixString = "M"

            // Checking thousand
        } else if num >= 1000 {
            valueRemained = num%1000
            num /= 1000
            sufixString = "k"
        }

        valueString = "\(num).\(valueRemained)" + (spaced ? " " : "") + sufixString

        return valueString
    }
}
