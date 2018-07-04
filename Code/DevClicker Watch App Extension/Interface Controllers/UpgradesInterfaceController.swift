//
//  RightInterfaceController.swift
//  DevClicker Watch App Extension
//
//  Created by Mauricio Lorenzetti on 28/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import WatchKit
import Foundation


class UpgradesInterfaceController: WKInterfaceController {

    @IBOutlet var locLabel: WKInterfaceLabel!
    @IBOutlet var dolLabel: WKInterfaceLabel!
    @IBOutlet var upgradesTable: WKInterfaceTable!
    
    var availableUpgrades:[Upgrade] = []
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        AppShared.game.gameDelegate.append(self)
        
    }
    
    override func willActivate() {
        self.refreshUpgradesTableContent()
        populateUpgradesTable()
    }
    
    private func populateUpgradesTable() {
        
        upgradesTable.setNumberOfRows(availableUpgrades.count, withRowType: "upgrades_table")
        
        for index in 0..<availableUpgrades.count {
            if let row = upgradesTable.rowController(at: index) as? UpgradesTableRowController {
                let upgrade = availableUpgrades[index]
                let dolCostString: String = (upgrade.dolCost != nil) ? "D$ " + WatchUIServices.dolStringFormat(dol: upgrade.dolCost!) : ""
                let locCostString: String = (upgrade.locCost != nil) ? WatchUIServices.locStringFormat(loc: upgrade.locCost!)  + " LoC" : ""
 
                row.titleLabel.setText(upgrade.title)
                row.descriptionLabel.setText(upgrade.description)
                row.dolPriceLabel.setText(dolCostString)
                row.locPriceLabel.setText(locCostString)
            }
        }
    }
    
    private func refreshUpgradesTableContent() {
        self.availableUpgrades = AppShared.game.gameStats.upgradesAvailable
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let upgradeSelected = self.availableUpgrades[rowIndex]
        if !UpgradeServices.buy(upgrade: upgradeSelected) {
            print("-> INFO: Couldn't buy selected upgrade")
        }
        self.refreshUpgradesTableContent()
    }

}

extension UpgradesInterfaceController: GameDelegate {
    
    func updateStats() {
        let playerStats = AppShared.game.gameStats.playerStats
        
        self.dolLabel.setText(String(WatchUIServices.dolStringFormat(dol: playerStats.dol)))
        self.locLabel.setText(String(WatchUIServices.locStringFormat(loc: playerStats.loc)))
    }
}

