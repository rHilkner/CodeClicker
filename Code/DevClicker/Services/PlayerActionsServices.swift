//
//  DevServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 24/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class PlayerActionsServices {

    static func codeLocTapped() {
        let productionStats = AppShared.game.gameStats.productionStats
        let tapBase = productionStats.tapBase
        let tapMultiplier = productionStats.tapMultiplier

        let locProduced = Int(tapBase * tapMultiplier)
        AppShared.game.gameStats.playerStats.loc += locProduced
    }

    static func hireDevTapped() {
        var playerStats = AppShared.game.gameStats.playerStats
        var marketStats = AppShared.game.gameStats.marketStats

        if playerStats.dols >= marketStats.devsPrice {
            playerStats.dols -= marketStats.devsPrice
            playerStats.devs += 1
            marketStats.devsPrice = floor(marketStats.devsBasePrice * 1.15 ^^ playerStats.devs * 100.0) / 100.0
        }

        AppShared.game.gameStats.playerStats = playerStats
        AppShared.game.gameStats.marketStats = marketStats
    }

    static func upgradeMarketingTapped() {
        var playerStats = AppShared.game.gameStats.playerStats
        var marketStats = AppShared.game.gameStats.marketStats

        if playerStats.dols >= marketStats.upgradeMktPrice {
            playerStats.dols -= marketStats.upgradeMktPrice
            playerStats.marketingLevel += 1
            marketStats.upgradeMktPrice = marketStats.upgradeMktBasePrice * 2 ^^ playerStats.marketingLevel
        }

        AppShared.game.gameStats.playerStats = playerStats
        AppShared.game.gameStats.marketStats = marketStats
    }

}
