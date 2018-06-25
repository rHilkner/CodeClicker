//
//  BizdevServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 24/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class MarketServices {

    // Return market demand in potencial of LoC selling per second (maximum value of LoC that the player can sell in 1 second)
    static func calculateLocDemand(game: Game) -> Int {
        let marketAtractiveness = game.marketStats.marketMultiplier * (game.marketStats.baseMarketAtractiveness/Double(game.playerStats.locPrice))
        let locDemand = game.playerStats.bizdevs * Int(game.playerStats.bizdevsMultiplier * marketAtractiveness)

        return locDemand
    }
}
