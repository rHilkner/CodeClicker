//
//  WatchSessionManager.swift
//  DevClicker Watch App Extension
//
//  Created by Mauricio Lorenzetti on 29/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//
//swiftlint:disable force_cast

import WatchConnectivity

class WatchSessionManager: NSObject, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        return
    }
    
    //TODO: arrumar esse force-cast
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String: Any]) {
        let jsonString = applicationContext["gameStats"] as! String
        if let jsonData = jsonString.data(using: .utf8) {
            if let gameStats = try? JSONDecoder().decode(GameData.self, from: jsonData) {
                AppShared.game.gameStats = gameStats
            }
        }
    }
    
    static let sharedManager = WatchSessionManager()
    private override init() {
        super.init()
    }
    
    private let session: WCSession = WCSession.default
    
    func startSession() {
        session.delegate = self
        session.activate()
    }
}
