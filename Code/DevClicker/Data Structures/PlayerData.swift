//
//  PlayerData.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 24/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

struct PlayerData: Codable {
    var dols: Int = 0
    var locs: Int = 0
    var locPrice: Int = 10
    var devs: Int = 0
    var bizdevs: Int = 0

    // Tap values
    let tapBase: Int = 1
    var tapMultipier: Double = 1.0
    // locTapValue: number of LoC created in each tap
    var locTapValue: Int {
        get {
            return Int(Double(tapBase) * tapMultipier)
        }
    }

    // Devs values
    let devsBase: Double = 1.0 // LoC/sec
    var devsMultiplier: Double = 1.0
    // devProduction: number of LoC devs create each second
    var devProduction: Int {
        get {
            return Int(Double(devs) * devsBase * devsMultiplier)
        }
    }

    // Bizdevs values
    let bizdevsBase: Double = 1.0
    var bizdevsMultiplier: Double = 1.0

}
