//
//  UIServicesProtocol.swift
//  DevClicker
//
//  Created by Mauricio Lorenzetti on 04/07/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation

protocol UIServicesProtocol {
    static func locStringFormat(loc: Int) -> String
    static func dolStringFormat(dol: Double) -> String
    static func valueToString(value: Int) -> String
}

