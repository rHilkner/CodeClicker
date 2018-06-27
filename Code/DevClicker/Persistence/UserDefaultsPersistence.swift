//
//  gameServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class UserDefaultsPersistence {

    static func save(game: Game) {
        guard let encodedPlayerStats = try? JSONEncoder().encode(game.gameStats) else {
            print("-> ERROR: coudn't save game data to User Defaults")
            return
        }

        print("-> INFO: Saving user data to User Defaults")
        UserDefaults.standard.set(encodedPlayerStats, forKey: "gameStats")
    }

    static func loadGame() -> Game {
        // Parsing player stats from data
        guard let gameData = UserDefaults.standard.data(forKey: "gameStats"),
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

        // Setting coffee-mkt rate to midium
        gameStats.playerStats.coffeeMktRate = 1.0

        let game = Game(gameStats: gameStats)
        return game
    }

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
