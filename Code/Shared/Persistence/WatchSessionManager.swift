//
//  WatchSessionManager.swift
//  DevClicker Watch App Extension
//
//  Created by Mauricio Lorenzetti on 29/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import WatchConnectivity

class WatchSessionManager: NSObject, WCSessionDelegate {
    
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
    
    static let sharedManager = WatchSessionManager()
    
    private override init() {
        super.init()
    }
    
    private let session: WCSession = WCSession.default
    /*
    private var validSession: WCSession? {
        
        // paired - the user has to have their device paired to the watch
        // watchAppInstalled - the user must have your watch app installed
        
        // Note: if the device is paired, but your watch app is not installed
        // consider prompting the user to install it for a better experience
        
        if let session = session, session.isPaired && session.isWatchAppInstalled {
            return session
        }
        return nil
    }*/
    
    func startSession() {
        session.delegate = self
        session.activate()
    }
    
    func updateGame(game: Game) throws {
        
        let encodedObject = try? JSONEncoder().encode(game.gameStats)
        
        //if let session = validSession {
            do {
                try session.updateApplicationContext(["gameStats": String(data: encodedObject!, encoding: .utf8)!])
            } catch let error {
                throw error
            }
        //}
    }
}
