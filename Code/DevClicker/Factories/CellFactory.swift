//
//  CellFactory.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 26/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import UIKit

/// Enum containing cell identifiers
public enum CellType: String {
    case upgrade = "UpgradeCell"
}

// swiftlint:disable force_cast
class CellFactory {

    /// Instantiates a cell from given table view and type
    static func upgradeCell(tableView: UITableView, upgrade: Upgrade) -> UpgradesTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellType.upgrade.rawValue) as! UpgradesTableViewCell

        cell.titleLabel.text = upgrade.title
        cell.descriptionLabel.text = upgrade.description
        if let dolCost = upgrade.dolCost {
            cell.dolCostLabel.text = String(format: "D$ %.2f", dolCost)
        } else {
            cell.dolCostLabel.text = ""
        }
        if let locCost = upgrade.locCost {
            cell.locCostLabel.text = "\(locCost) LoC"
        } else {
            cell.locCostLabel.text = ""
        }

        return cell
    }

}
// swiftlint:enable force_cast
