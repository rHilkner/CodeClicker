//
//  InterfaceController.swift
//  DevClicker Watch App Extension
//
//  Created by Mauricio Lorenzetti on 28/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import WatchKit
import Foundation


class LeftInterfaceController: WKInterfaceController {

    @IBOutlet var locLabel: WKInterfaceLabel!
    @IBOutlet var dolLabel: WKInterfaceLabel!
    @IBOutlet var devAmountLabel: WKInterfaceLabel!
    @IBOutlet var pcAmountLabel: WKInterfaceLabel!
    @IBOutlet var devPriceLabel: WKInterfaceLabel!
    @IBOutlet var pcPriceLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        AppShared.game.gameDelegate.append(self)
        
    }
    
    @IBAction func devUp() {
    }
    
    @IBAction func pcUp() {
    }

}

extension LeftInterfaceController: GameDelegate {
    
    func updateStats() {
        let playerStats = AppShared.game.gameStats.playerStats
        let marketStats = AppShared.game.gameStats.marketStats
        
        self.dolLabel.setText(String(format: "%2.1f", playerStats.dols))
        self.locLabel.setText(String(format: "%2.1f", playerStats.loc))
    }
    
}
