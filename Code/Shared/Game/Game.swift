//
//  Game.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 24/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

protocol GameDelegate: NSObjectProtocol {
    func updateStats()
}

class Game {

    var gameStats: GameData
    weak var gameDelegate: GameDelegate?

    init() {
        self.gameStats = GameData()
        self.gameStats.playerStats.loc = 12000
    }

    init(gameStats: GameData?) {
        if let unwrappedGameStats = gameStats {
            self.gameStats = unwrappedGameStats
        } else {
            self.gameStats = GameData()
        }
    }

    // swiftlint:disable function_body_length
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
            var locDemand: Double = 0
            var locSold: Int = 0

            // Loop forever:
            while true {

                currentTime = Date()
                timeInterval = currentTime.timeIntervalSince1970 - lastTime.timeIntervalSince1970

                DispatchQueue.main.sync {
                    // Calculating production of LoC by devs
                    let locProductionPerSec = Double(CodeServices.calculateDevLocProduction(game: self))
                    if locProductionPerSec == 0 {
                        locProductionFractionRemained = 0
                    }
                    locProduction = locProductionPerSec * timeInterval + locProductionFractionRemained
                    locProduced = Int(locProduction)
                    locProductionFractionRemained = locProduction - floor(locProduction)
                    self.gameStats.playerStats.loc += locProduced

                    // Calculating LoC sold by bizdevs
                    if self.gameStats.playerStats.loc == 0 {
                        locSoldFractionRemained = 0
                    }
                    locDemand = MarketServices.calculateLocDemand(game: self)
                    locToSell = min(Double(self.gameStats.playerStats.loc),
                                    locDemand * timeInterval + locSoldFractionRemained)
                    locSold = Int(locToSell)
                    locSoldFractionRemained = locToSell - floor(locToSell)
                    self.gameStats.playerStats.loc -= locSold

                    let sellLocPrice = self.gameStats.marketStats.sellLocBasePrice *
                                        self.gameStats.marketStats.sellLocPriceMultiplier
                    let locProfit = Double(locSold) * sellLocPrice
                    self.gameStats.playerStats.dols += locProfit

                    // Updating labels from delegate
                    self.gameDelegate?.updateStats()
                    
                    //try? WatchSessionServerManager.sharedManager.updateGame(game: AppShared.game)
                    
                }

                lastTime = currentTime
                loopCounter += 1
                if loopCounter == 10000 {
                    UserDefaultsPersistence.saveGame()
                    loopCounter = 0
                }
            }
        }
    }
    // swift_lint:enable function_body_length

}
