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
        let productionStats = AppShared.game.productionStats
        let tapBase = productionStats.tapBase
        let tapMultiplier = productionStats.tapMultiplier

        let locProduced = Int(tapBase * tapMultiplier)
        AppShared.game.playerStats.loc += locProduced
    }

    static func hireDevTapped() {
        var playerStats = AppShared.game.playerStats
        var marketStats = AppShared.game.marketStats
        let devPrice = marketStats.devsBasePrice * marketStats.devsPriceMultiplier

        if playerStats.dols >= devPrice {
            playerStats.dols -= devPrice
            playerStats.devs += 1
            marketStats.devsPrice = marketStats.devsBasePrice * 1.15 ^^ playerStats.devs
        }

        AppShared.game.playerStats = playerStats
        AppShared.game.marketStats = marketStats
    }

    static func upgradeMarketingTapped() {
        var playerStats = AppShared.game.playerStats
        var marketStats = AppShared.game.marketStats

        if playerStats.dols >= marketStats.upgradeMktPrice {
            playerStats.dols -= marketStats.upgradeMktPrice
            playerStats.marketingLevel += 1
            marketStats.upgradeMktPrice = marketStats.upgradeMktBasePrice * 2 ^^ playerStats.marketingLevel
        }

        AppShared.game.playerStats = playerStats
        AppShared.game.marketStats = marketStats
    }

}
