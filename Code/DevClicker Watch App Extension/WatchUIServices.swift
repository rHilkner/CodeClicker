//
//  WatchUIServices.swift
//  DevClicker Watch App Extension
//
//  Created by Mauricio Lorenzetti on 29/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class WatchUIServices: UIServicesProtocol {
    
    /// Represents the LoC quantity into a string in the format: "D$ XXX.Xk" or "D$ XXX.XM"
    static func locStringFormat(loc: Int) -> String {
        var locString = "\(loc)"
        let locValue = loc
        
        // If value is greater than thousands, then it needs formatting
        if locValue >= 1000 {
            let locValueString = self.valueToString(value: locValue, spaced: false)
            locString = locValueString
        }
        
        return locString
    }
    
    /// Represents the LoC quantity into a string in the format: "D$ XXX.X k" or "D$ XXX.X M"
    static func dolStringFormat(dol: Double) -> String {
        var dolString = String(format: "%.1f", dol)
        let dolValue = Int(dol)
        
        // If value is greater than thousands, then it needs formatting
        if dolValue >= 1000 {
            let dolValueString = self.valueToString(value: dolValue, spaced: false)
            dolString = dolValueString
        }
        
        return dolString
    }
    
}
