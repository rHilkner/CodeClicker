//
//  DevServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 24/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class PlayerActionsServices {

    /// Performs standard action for when the user taps "Code LoC" button
    static func codeLocTapped() {
        let productionStats = AppShared.game.gameStats.productionStats
        let tapBase = productionStats.tapBase
        let tapMultiplier = productionStats.tapMultiplier

        let locProduced = Int(tapBase * tapMultiplier)
        AppShared.game.gameStats.playerStats.loc += locProduced
        PersistenceServices.sendDataToWatch()
    }

    /// Performs standard action for when the user taps "Hire dev" button
    static func hireDevTapped() {
        var playerStats = AppShared.game.gameStats.playerStats
        let marketStats = AppShared.game.gameStats.marketStats

        if playerStats.dol >= marketStats.devsPrice && playerStats.devs < playerStats.pcs {
            playerStats.dol -= marketStats.devsPrice
            playerStats.devs += 1
        }

        AppShared.game.gameStats.playerStats = playerStats
        MarketServices.updateDevPrice()
        PersistenceServices.sendDataToWatch()
    }

    /// Performs standard action for when the user taps "Upgrade Marketing Level" button
    static func upgradeMarketingTapped() {
        var playerStats = AppShared.game.gameStats.playerStats
        let marketStats = AppShared.game.gameStats.marketStats

        if playerStats.dol >= marketStats.upgradeMktPrice {
            playerStats.dol -= marketStats.upgradeMktPrice
            playerStats.marketingLevel += 1
        }

        AppShared.game.gameStats.playerStats = playerStats
        MarketServices.updateMktPrice()
        PersistenceServices.sendDataToWatch()
    }

    /// Performs standard action for when the user taps "Buy PC" button
    static func addPcTapped() {
        var playerStats = AppShared.game.gameStats.playerStats
        let marketStats = AppShared.game.gameStats.marketStats

        if playerStats.dol >= marketStats.pcPrice {
            playerStats.dol -= marketStats.pcPrice
            playerStats.pcs += 1
        }

        AppShared.game.gameStats.playerStats = playerStats
        MarketServices.updatePcPrice()
        PersistenceServices.sendDataToWatch()
    }

}
