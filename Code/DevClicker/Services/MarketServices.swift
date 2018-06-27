//
//  BizdevServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 24/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class MarketServices {

    /** Return market demand in potencial of LoC selling per second
      * (maximum value of LoC that the player can sell in 1 second) */
    static func calculateLocDemand() -> Double {
        let playerStats = AppShared.game.gameStats.playerStats
        let marketStats = AppShared.game.gameStats.marketStats
        let locDemand = marketStats.baseMarketAtractiveness * marketStats.marketMultiplier *
                        (playerStats.coffeeMktRate) * 2.0 ^^ playerStats.marketingLevel
        return locDemand
    }

    /// Calculates selling price of a LoC
    static func calculateLocPrice() -> Double {
        let marketStats = AppShared.game.gameStats.marketStats
        let sellPrice = marketStats.sellLocBasePrice * marketStats.sellLocPriceMultiplier
        return sellPrice
    }
}
