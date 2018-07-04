//
//  GameData.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 26/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

struct GameData: Codable {
    var playerStats: PlayerData
    var productionStats: ProductionData
    var marketStats: MarketData
    var upgradesAvailable: [Upgrade]
    var lastSaveTimeInterval: TimeInterval = 0.0

    init() {
        self.playerStats = PlayerData()
        self.productionStats = ProductionData()
        self.marketStats = MarketData()
        self.upgradesAvailable = UserDefaultsPersistence.fetchUpgradesList()
    }
}
