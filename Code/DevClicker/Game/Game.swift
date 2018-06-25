//
//  Game.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 24/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class Game {

    var playerStats: PlayerData
    var marketStats: MarketData

    init() {
        self.playerStats = PlayerData()
        self.marketStats = MarketData()
    }

    init(playerStats: PlayerData?, marketStats: MarketData?) {
        if let _playerStats = playerStats,
            let _marketStats = marketStats {
            self.playerStats = _playerStats
            self.marketStats = _marketStats
        } else {
            self.playerStats = PlayerData()
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

            //
            var locProduced: Int = 0
            var locDemand: Int = 0
            var locSold: Int = 0

            // Loop forever:
            while true {
                currentTime = Date()
                timeInterval = currentTime.timeIntervalSince1970 - lastTime.timeIntervalSince1970

                DispatchQueue.main.sync {
                    // Calculating production of LoC by devs
                    locProduction = Double(self.playerStats.devProduction) * timeInterval + locProductionFractionRemained
                    locProduced = Int(locProduction)
                    locProductionFractionRemained = locProduction - floor(locProduction)

                    // Calculating LoC sold by bizdevs
                    locDemand = MarketServices.calculateLocDemand(game: self)
                    locToSell = Double(min(self.playerStats.locs, locDemand)) * timeInterval + locSoldFractionRemained
                    locSold = Int(locToSell)
                    locSoldFractionRemained = locToSell - floor(locToSell)

                    self.playerStats.locs += locProduced - locSold
                    let locProfit = locSold * self.playerStats.locPrice
                    self.playerStats.dols += locProfit
                }
                
                lastTime = currentTime

                loopCounter += 1
                if loopCounter == 1000 {
                    UserDefaultsServices.save(game: self)
                    loopCounter = 0
                }
            }
        }
    }

}
