//
//  MarketData.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

/** MarketData variables can't be controlled by the user (they are automatically
  * updated by the system) and they set pace on the LoC market. */
struct MarketData: Codable {
    // devPrice = devsBasePrice * devsPriceMultiplier * 1.07 ^ playerStats.devs
    var devsBasePrice: Double = 5.00
    var devsPriceMultiplier: Double = 1.0
    var devsPrice: Double = 5.00
    // pcPrice = pcBasePrice * pcPriceMultiplier * 1.08 ^ playerStats.pcs
    var pcBasePrice: Double = 5.00
    var pcPriceMultiplier: Double = 1.0
    var pcPrice: Double = 5.00
    // sellLocPrice = sellLocBasePrice * sellLocPriceMultiplier
    var sellLocBasePrice: Double = 1.00
    var sellLocPriceMultiplier: Double = 1.0
    // upgradeMktPrice = upgradeMktLvlBasePrice * 2^marketLevel
    var upgradeMktBasePrice = 200.00
    var upgradeMktPrice = 400.00

    // If baseMarketAtractiveness (and marketMultiplier is 1.0) then player sells 1 LoC/sec
    // potential LoC sold per sec = baseMarketAtractiveness * marketMultiplier * 2^marketLevel
    let baseMktAtractiveness: Double = 1.0
    var marketMultiplier: Double = 1.0
}
