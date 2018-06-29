//
//  MiddleInterfaceController.swift
//  DevClicker Watch App Extension
//
//  Created by Mauricio Lorenzetti on 28/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import WatchKit
import Foundation

class MiddleInterfaceController: WKInterfaceController {
    
    @IBOutlet var locLabel: WKInterfaceLabel!
    @IBOutlet var dolLabel: WKInterfaceLabel!
    @IBOutlet var devsLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        self.becomeCurrentPage()
        
        AppShared.game.gameDelegate = self
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

extension MiddleInterfaceController: GameDelegate {
    
    func updateStats() {
        let playerStats = AppShared.game.gameStats.playerStats
        let marketStats = AppShared.game.gameStats.marketStats
        
        self.dolLabel.setText(String(format: "%.2f", playerStats.dols))
         
        self.locLabel.setText(String(format: "%.2f", playerStats.loc))
    
        self.devsLabel.setText(String(playerStats.devs))
        
    }
    
}
