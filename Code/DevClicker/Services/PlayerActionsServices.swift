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
        self.sendDataToWatch()
    }

    static func hireDevTapped() {
        var playerStats = AppShared.game.gameStats.playerStats
        let marketStats = AppShared.game.gameStats.marketStats

        if playerStats.dols >= marketStats.devsPrice && playerStats.devs < playerStats.pcs {
            playerStats.dols -= marketStats.devsPrice
            playerStats.devs += 1
        }

        AppShared.game.gameStats.playerStats = playerStats
        MarketServices.updateDevPrice()
        self.sendDataToWatch()
    }

    static func upgradeMarketingTapped() {
        var playerStats = AppShared.game.gameStats.playerStats
        let marketStats = AppShared.game.gameStats.marketStats

        if playerStats.dols >= marketStats.upgradeMktPrice {
            playerStats.dols -= marketStats.upgradeMktPrice
            playerStats.marketingLevel += 1
        }

        AppShared.game.gameStats.playerStats = playerStats
        MarketServices.updateMktPrice()
        self.sendDataToWatch()
    }

    static func addPcTapped() {
        var playerStats = AppShared.game.gameStats.playerStats
        let marketStats = AppShared.game.gameStats.marketStats

        if playerStats.dols >= marketStats.pcPrice {
            playerStats.dols -= marketStats.pcPrice
            playerStats.pcs += 1
        }

        AppShared.game.gameStats.playerStats = playerStats
        MarketServices.updatePcPrice()
        self.sendDataToWatch()
    }
    
    static func sendDataToWatch() {
        UserDefaultsPersistence.saveGame()
        try? WatchSessionManager.sharedManager.updateGame(game: AppShared.game)
    }

}
