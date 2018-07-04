//
//  CoreMotionServices.swift
//  DevClicker Watch App Extension
//
//  Created by Rodrigo Hilkner on 04/07/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation
import CoreMotion

class CoreMotionServices {

    /// Initialises Core Motion for the game. Not working yet.
//    static func initializeCoreMotion(game: Game) {
//        if #available(iOS 11.0, *) {
//            let pedometer = CMPedometer()
//            let lastSaveTime = game.gameStats.lastSaveTimeInterval
//            let currentTime = Date().timeIntervalSince1970
//
//            if CMPedometer.authorizationStatus() == .authorized {
//                if CMPedometer.isDistanceAvailable() {
//                    pedometer.queryPedometerData(from: Date(timeIntervalSince1970: lastSaveTime), to: Date(timeIntervalSince1970: currentTime)) { (data, _) in
//                        if let distanceCount = data?.distance {
//                            game.gameStats.playerStats.dol += Double(truncating: distanceCount) * 1000.0
//                        }
//                    }
//                }
//            }
//        }
//    }
    
}
