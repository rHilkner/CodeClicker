//
//  MarketData.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

struct MarketData: Codable {
    var devsBasePrice: Int = 10
    var devsPrice: Int = 10
    let bizdevsBasePrice: Int = 10
    var bizdevsPrice: Int = 10
    var marketMultiplier: Double = 1.0
    let baseMarketAtractiveness: Double = 10.0
}
