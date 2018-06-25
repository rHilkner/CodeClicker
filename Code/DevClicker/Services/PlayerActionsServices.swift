//
//  DevServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 24/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class PlayerActionsServices {

    static func codeLocTapped(_ game: Game) {
        game.playerStats.locs += game.playerStats.locTapValue
    }

    static func hireDevTapped(_ game: Game) {
        if game.playerStats.dols >= game.marketStats.devsPrice {
            game.playerStats.dols -= game.marketStats.devsPrice
            game.playerStats.devs += 1
            game.marketStats.devsPrice = game.marketStats.devsBasePrice * Int(1.15 ^^ game.playerStats.devs)
        }
    }

    static func hireBizdevTapped(_ game: Game) {
        if game.playerStats.dols >= game.marketStats.bizdevsPrice {
            game.playerStats.dols -= game.marketStats.bizdevsPrice
            game.playerStats.bizdevs += 1
            game.marketStats.bizdevsPrice = game.marketStats.bizdevsBasePrice * Int(1.11 ^^ game.playerStats.bizdevs)
        }
    }
}
