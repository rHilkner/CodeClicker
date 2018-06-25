//
//  gameServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class UserDefaultsServices {

    static func save(game: Game) {
        guard let encodedPlayerStats = try? JSONEncoder().encode(game.playerStats),
            let encodedMarketStats = try? JSONEncoder().encode(game.marketStats) else {
            print("-> ERROR: coudn't save game data to User Defaults")
            return
        }

        print("-> INFO: Saving user data to User Defaults")
        UserDefaults.standard.set(encodedPlayerStats, forKey: "playerStats")
        UserDefaults.standard.set(encodedMarketStats, forKey: "marketStats")
    }

    static func loadGame() -> Game {
        guard let playerData = UserDefaults.standard.data(forKey: "playerStats"),
            let playerStats = try? JSONDecoder().decode(PlayerData.self, from: playerData) as PlayerData else {
                print("-> ERROR: coudn't load player stats from User Defaults")
                return Game()
        }

        guard let marketData = UserDefaults.standard.data(forKey: "marketStats"),
            let marketStats = try? JSONDecoder().decode(MarketData.self, from: marketData) as MarketData else {
                print("-> ERROR: coudn't load market stats from User Defaults")
                return Game()
        }

        let game = Game(playerStats: playerStats, marketStats: marketStats)
        return game
    }


}
