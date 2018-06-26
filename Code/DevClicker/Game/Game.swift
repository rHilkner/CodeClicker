//
//  Game.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 24/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

protocol GameDelegate {
    func updateStats()
}

class Game {

    var playerStats: PlayerData
    var productionStats: ProductionData
    var marketStats: MarketData
    var gameDelegate: GameDelegate? = nil

    init() {
        self.playerStats = PlayerData()
        self.productionStats = ProductionData()
        self.marketStats = MarketData()
    }

    init(playerStats: PlayerData?, productionStats: ProductionData?, marketStats: MarketData?) {
        if let _playerStats = playerStats,
            let _productionStats = productionStats,
            let _marketStats = marketStats {
            self.playerStats = _playerStats
            self.productionStats = _productionStats
            self.marketStats = _marketStats
        } else {
            self.playerStats = PlayerData()
            self.productionStats = ProductionData()
            self.marketStats = MarketData()
        }
    }

    /// Starts game loop
    func executeGameLoop() {
        DispatchQueue.global().async {

            var loopCounter = 0

            var lastTime = Date()
            var currentTime = lastTime
            var timeInterval: TimeInterval = currentTime.timeIntervalSince1970 - lastTime.timeIntervalSince1970

            // Keeping variables that store fractions of LoC and dols remained from each iteration
            var locProduction: Double = 0.0
            var locProductionFractionRemained: Double = 0.0
            var locToSell: Double = 0.0
            var locSoldFractionRemained: Double = 0.0

            // Variables that will be incremented to player stats
            var locProduced: Int = 0
            var locDemand: Int = 0
            var locSold: Int = 0

            // Loop forever:
            while true {
                currentTime = Date()
                timeInterval = currentTime.timeIntervalSince1970 - lastTime.timeIntervalSince1970

                DispatchQueue.main.sync {
                    // Calculating production of LoC by devs
                    locProduction = Double(CodeServices.calculateDevLocProduction()) * timeInterval + locProductionFractionRemained
                    locProduced = Int(locProduction)
                    locProductionFractionRemained = locProduction - floor(locProduction)

                    // Calculating LoC sold by bizdevs
                    locDemand = MarketServices.calculateLocDemand()
                    locToSell = Double(min(self.playerStats.loc, locDemand)) * timeInterval + locSoldFractionRemained
                    locSold = Int(locToSell)
                    locSoldFractionRemained = locToSell - floor(locToSell)

                    self.playerStats.loc += locProduced - locSold
                    let sellLocPrice = self.marketStats.sellLocBasePrice * self.marketStats.sellLocPriceMultiplier
                    let locProfit = Double(locSold) * sellLocPrice
                    self.playerStats.dols += locProfit

                    // Updating labels from delegate
                    self.gameDelegate?.updateStats()
                }
                
                lastTime = currentTime

                loopCounter += 1
                if loopCounter == 1000000 {
                    UserDefaultsPersistence.save(game: self)
                    loopCounter = 0
                }
            }
        }
    }

}
