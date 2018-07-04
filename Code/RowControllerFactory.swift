//
//  RowControllerFactory.swift
//  DevClicker Watch App Extension
//
//  Created by Rodrigo Hilkner on 04/07/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation
import WatchKit

enum RowControllerType: String {
    case upgradeRow = "UpgradeRow"
}

class RowControllerFactory {

    /// Instantiates rows for WK Interface Table
    static func setNumberOfRows(ofType type: RowControllerType, forTable table: WKInterfaceTable, count: Int) {
        table.setNumberOfRows(count, withRowType: type.rawValue)
    }

}
