//
//  CellFactory.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 26/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import UIKit

public enum CellType: String {
    case upgrade = "UpgradeCell"
}

// swiftlint:disable force_cast
class CellFactory {

    // TODO: UI/Unit test here
    static func upgradeCell(tableView: UITableView, upgrade: Upgrade) -> UpgradesTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellType.upgrade.rawValue) as! UpgradesTableViewCell

        cell.titleLabel.text = upgrade.title
        cell.descriptionLabel.text = upgrade.description
        if let dolCost = upgrade.dolCost {
            cell.dolCostLabel.text = String(format: "D$ %.2f", dolCost)
        }
        if let locCost = upgrade.locCost {
            cell.locCostLabel.text = "\(locCost) LoC"
        }

        return cell
    }

}
// swiftlint:enable force_cast

