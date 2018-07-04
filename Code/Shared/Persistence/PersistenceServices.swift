//
//  PersistenceServices.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 04/07/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

class PersistenceServices {

    /// Sends game data to connected Apple Watch device
    static func sendDataToWatch() {
        self.saveGame()
        try? WatchSessionManager.sharedManager.updateGame(game: AppShared.game)
    }

    /// Saves the current game on database
    static func saveGame() {
        // Saving game to user defaults
        UserDefaultsPersistence.saveGame()
    }
    
}
