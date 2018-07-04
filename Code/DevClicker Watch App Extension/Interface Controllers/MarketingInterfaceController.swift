//
//  MarketInterfaceController.swift
//  DevClicker Watch App Extension
//
//  Created by Mauricio Lorenzetti on 29/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import WatchKit
import Foundation


class MarketingInterfaceController: WKInterfaceController {

    @IBOutlet var locLabel: WKInterfaceLabel!
    @IBOutlet var dolLabel: WKInterfaceLabel!
    @IBOutlet var mktLvlPriceLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        AppShared.game.gameDelegate.append(self)
        
    }
    
    @IBAction func mktLvlUp() {
        PlayerActionsServices.upgradeMarketingTapped()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

extension MarketingInterfaceController: GameDelegate {
    
    func updateStats() {
        let playerStats = AppShared.game.gameStats.playerStats
        let marketStats = AppShared.game.gameStats.marketStats
        
        self.dolLabel.setText(String(WatchUIServices.dolStringFormat(dol: playerStats.dol)))
        self.locLabel.setText(String(WatchUIServices.locStringFormat(loc: playerStats.loc)))
        self.mktLvlPriceLabel.setText("D$ " + String(WatchUIServices.dolStringFormat(dol: marketStats.upgradeMktPrice)))
    }
    
}
