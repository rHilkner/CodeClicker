//
//  ProductionData.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

struct ProductionData: Codable {
    let tapBase: Double = 1.0
    var tapMultiplier: Double = 1.0

    // lines coded per sec = devsBase * devsMultiplier
    let devsBase: Double = 1.0
    var devsMultiplier: Double = 1.0
}
