//
//  UpgradeServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 26/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class UpgradeServices {

    static func buy(upgrade: Upgrade) -> Bool {
        let upgradesAvailable = AppShared.game.gameStats.upgradesAvailable

        // Finding upgrade bought from list of available upgrades
        guard let upgradeBoughtIndex = upgradesAvailable.index(where: { (upgradeItem) in
            return upgradeItem.id == upgrade.id
        }) else {
            // Should never enter this conditional
            print("-> ERROR: Could not find any upgrade available with index \(upgrade.id)")
            return false
        }

        // Instantiating game stats
        var playerStats = AppShared.game.gameStats.playerStats
        var productionStats = AppShared.game.gameStats.productionStats
        var marketStats = AppShared.game.gameStats.marketStats

        if playerStats.dols < (upgrade.dolCost ?? 0) ||
            playerStats.loc < (upgrade.locCost ?? 0) {
            print("-> INFO: Player doesn't have enough dol or loc to buy the upgrade")
            return false
        }

        // Discounting dol and loc from player
        playerStats.dols -= upgrade.dolCost ?? 0
        playerStats.loc -= upgrade.locCost ?? 0

        // Calculating production and market upgrades
        productionStats.tapMultiplier *= upgrade.tapMultiplier ?? 1
        productionStats.devsMultiplier *= upgrade.devsMultiplier ?? 1
        marketStats.marketMultiplier *= upgrade.marketingMultiplier ?? 1
        marketStats.sellLocPriceMultiplier *= upgrade.sellLocPriceMultiplier ?? 1
        marketStats.devsPriceMultiplier *= upgrade.devsPriceMultiplier ?? 1
        marketStats.pcPriceMultiplier *= upgrade.pcPriceMultiplier ?? 1

        // Updating game stats
        AppShared.game.gameStats.playerStats = playerStats
        AppShared.game.gameStats.productionStats = productionStats
        AppShared.game.gameStats.marketStats = marketStats
        AppShared.game.gameStats.upgradesAvailable.remove(at: upgradeBoughtIndex)
        AppShared.game.gameStats.playerStats.upgradesBought.append(upgrade)

        MarketServices.updateDevPrice()
        MarketServices.updatePcPrice()

        print("-> INFO: Upgrade bought successfully")

        return true
    }
}
