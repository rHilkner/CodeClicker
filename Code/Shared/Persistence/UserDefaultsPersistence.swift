//
//  gameServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class UserDefaultsPersistence {

    /// Reference to the shared User Defaults object
    private static let defaults = UserDefaults.standard

    /// Saves game to database
    static func saveGame() {
        let game = AppShared.game
        game.gameStats.lastSaveTimeInterval = Date().timeIntervalSince1970
        guard let encodedPlayerStats = try? JSONEncoder().encode(game.gameStats) else {
            print("-> ERROR: coudn't save game data to User Defaults")
            return
        }
    
        print("-> INFO: Saving user data to User Defaults")
        self.defaults.set(encodedPlayerStats, forKey: "gameStats")
    }

    /// Loads game data from User Defaults and retrivies currente game stats
    static func loadGame() -> Game {
        
        // Parsing player stats from data
        guard let gameData = defaults.data(forKey: "gameStats"),
            var gameStats = try? JSONDecoder().decode(GameData.self, from: gameData) as GameData else {
                print("-> ERROR: coudn't load player stats from User Defaults")
                return Game()
        }

        // Getting available upgrades list
        let upgradesList = UserDefaultsPersistence.fetchUpgradesList()
        let upgradesBought = gameStats.playerStats.upgradesBought
        gameStats.upgradesAvailable = upgradesList.filter { (upgrade) in
            !upgradesBought.contains { (upgradeBought) in
                upgradeBought.id == upgrade.id
            }
        }

        let game = Game(gameStats: gameStats)

        // Calculating idle profits
        let currentTime = Date().timeIntervalSince1970
        let lastSaveTime = game.gameStats.lastSaveTimeInterval
        let diffTime = currentTime - lastSaveTime
        let devProductivity = diffTime * CodeServices.calculateDevLocProduction(game: game)
        game.gameStats.playerStats.loc += Int(devProductivity)
        let mktDemand = Int(diffTime * MarketServices.calculateLocDemand(game: game))
        let mktSellings = min(game.gameStats.playerStats.loc, mktDemand)
        let mktProfit = Double(mktSellings) * MarketServices.calculateLocPrice(game: game)
        game.gameStats.playerStats.loc -= mktSellings
        game.gameStats.playerStats.dol += mktProfit
        
        // Earn money with CoreMotion updates (only for iOS 11.0+ and watchOS)
//        CoreMotionServices.initializeCoreMotion(game: game)

        print("INFO: Game data loaded.")

        return game
    }

    /// Retrieves upgrades list from local JSON
    static func fetchUpgradesList() -> [Upgrade] {

        guard let upgradesUrl = Bundle.main.url(forResource: "upgrades", withExtension: "json"),
            let upgradesData = try? Data(contentsOf: upgradesUrl),
            let upgradesList = try? JSONDecoder().decode([Upgrade].self, from: upgradesData) as [Upgrade] else {
            print("-> ERROR: coudn't load full upgrades list from User Defaults")
            return []
        }

        return upgradesList
    }

}
