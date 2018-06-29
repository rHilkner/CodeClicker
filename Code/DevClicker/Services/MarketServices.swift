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
    static func calculateLocDemand(game: Game) -> Double {
        let playerStats = game.gameStats.playerStats
        let marketStats = game.gameStats.marketStats
        let locDemand = marketStats.baseMarketAtractiveness * marketStats.marketMultiplier *
                        (playerStats.coffeeMktRate) * 2.0 ^^ playerStats.marketingLevel
        return locDemand
    }

    /// Calculates selling price of a LoC
    static func calculateLocPrice(game: Game) -> Double {
        let marketStats = game.gameStats.marketStats
        let sellPrice = marketStats.sellLocBasePrice * marketStats.sellLocPriceMultiplier
        return sellPrice
    }

    static func updateDevPrice() {
        let playerStats = AppShared.game.gameStats.playerStats
        var marketStats = AppShared.game.gameStats.marketStats

        marketStats.devsPrice = floor(marketStats.devsPriceMultiplier *  marketStats.devsBasePrice *
            1.07 ^^ playerStats.devs * 100.0) / 100.0

        AppShared.game.gameStats.marketStats = marketStats
    }

    static func updatePcPrice() {
        let playerStats = AppShared.game.gameStats.playerStats
        var marketStats = AppShared.game.gameStats.marketStats

        marketStats.pcPrice = floor(marketStats.pcPriceMultiplier * marketStats.pcBasePrice *
            1.08 ^^ playerStats.pcs * 100.0) / 100.0

        AppShared.game.gameStats.marketStats = marketStats
    }

    static func updateMktPrice() {
        let playerStats = AppShared.game.gameStats.playerStats
        var marketStats = AppShared.game.gameStats.marketStats

        marketStats.upgradeMktPrice = marketStats.upgradeMktBasePrice *
            2 ^^ playerStats.marketingLevel

        AppShared.game.gameStats.marketStats = marketStats
    }

}
