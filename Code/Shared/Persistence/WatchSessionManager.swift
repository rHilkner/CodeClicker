//
//  WatchSessionManager.swift
//  DevClicker Watch App Extension
//
//  Created by Mauricio Lorenzetti on 29/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import WatchConnectivity

class WatchSessionManager: NSObject, WCSessionDelegate {

    static let sharedManager = WatchSessionManager()

    private override init() {
        super.init()
    }
    
    #if os(iOS)
    public func sessionDidBecomeInactive(_ session: WCSession) {
        return
    }
    
    public func sessionDidDeactivate(_ session: WCSession) {
        return
    }
    #endif
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        return
    }

    /// Updates local game stats from received data from application context
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String: Any]) {
        if let jsonString = applicationContext["gameStats"] as? String {
            if let jsonData = jsonString.data(using: .utf8) {
                if let gameStats = try? JSONDecoder().decode(GameData.self, from: jsonData) {
                    AppShared.game.gameStats = gameStats
                    UserDefaultsPersistence.saveGame()
                }
            }
        }
    }
    
    private let session: WCSession = WCSession.default
    
    func startSession() {
        session.delegate = self
        session.activate()
    }

    /// Sends game stats from current device to other device connected to application context
    func updateGame(game: Game) throws {
        
        let encodedObject = try? JSONEncoder().encode(game.gameStats)
    
        do {
            try session.updateApplicationContext(["gameStats": String(data: encodedObject!, encoding: .utf8)!])
        } catch let error {
            throw error
        }
    }
}
