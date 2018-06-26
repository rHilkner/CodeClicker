//
//  PlayerData.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 24/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

/// PlayerData variables are measure units that the player activelly produced
struct PlayerData: Codable {
    var dols: Double = 0
    var loc: Int = 0
    var pcs: Int = 0
    var devs: Int = 0
    var marketingLevel: Int = 1
    /// If coffeeMktRate is 0.0, devs production are 2.0x and marketing selling is 0.0x.  Else if coffeMktRate is 2.0, then devs production is multiplied by 0.0x and marketing selling potential is multiplied by 2.0x.
    var coffeeMktRate: Double = 1.0

}
