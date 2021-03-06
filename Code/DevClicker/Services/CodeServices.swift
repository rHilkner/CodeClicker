//
//  DevServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class CodeServices {

    /// Calculates how many LoC are produced in one tap
    static func calculateLocTapValue(game: Game) -> Int {
        let productionStats = game.gameStats.productionStats
        let locTapValue = Int(Double(productionStats.tapBase) * productionStats.tapMultiplier)
        return locTapValue
    }

    /// Calculates how many LoC each dev produce in one second
    static func calculateDevLocProduction(game: Game) -> Double {
        let playerStats = game.gameStats.playerStats
        let productionStats = game.gameStats.productionStats
        let locProduction = productionStats.devsBase * productionStats.devsMultiplier *
                            (2-playerStats.coffeeMktRate) * Double(playerStats.devs)
        return locProduction
    }

}
