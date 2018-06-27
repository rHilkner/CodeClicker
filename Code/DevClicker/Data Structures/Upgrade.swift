//
//  Upgrade.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

// swiftlint:disable identifier_name
struct Upgrade: Codable {
    let id: Int
    let title: String
    let description: String
    let locCost: Int?
    let dolCost: Double?
    let tapMultiplier: Double?
    let devsMultiplier: Double?
    let marketingMultiplier: Double?
    let sellLocPriceMultiplier: Double?
    let devsPriceMultiplier: Double?
    let pcPriceMultiplier: Double?
}
// swiftlint:enable identifier_name
