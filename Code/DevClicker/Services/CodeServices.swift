//
//  DevServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class CodeServices {

    static func calculateLocTapValue() -> Int {
        let productionStats = AppShared.game.productionStats
        let locTapValue = Int(Double(productionStats.tapBase) * productionStats.tapMultiplier)
        return locTapValue
    }

    static func calculateDevLocProduction() -> Double {
        let playerStats = AppShared.game.playerStats
        let productionStats = AppShared.game.productionStats
        let locProduction = productionStats.devsBase * productionStats.devsMultiplier *
                            (2-playerStats.coffeeMktRate) * Double(playerStats.devs)
        return locProduction
    }

}
