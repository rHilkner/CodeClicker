//
//  InterfaceController.swift
//  DevClicker Watch App Extension
//
//  Created by Mauricio Lorenzetti on 28/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import WatchKit
import Foundation


class CodeInterfaceController: WKInterfaceController {

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
        PlayerActionsServices.hireDevTapped()
    }
    
    @IBAction func pcUp() {
        PlayerActionsServices.addPcTapped()
    }
    
}

extension CodeInterfaceController: GameDelegate {
    
    func updateStats() {
        let playerStats = AppShared.game.gameStats.playerStats
        let marketStats = AppShared.game.gameStats.marketStats
        
        self.dolLabel.setText(String(WatchUIServices.dolStringFormat(dol: playerStats.dol)))
        self.locLabel.setText(String(WatchUIServices.locStringFormat(loc: playerStats.loc)))
        self.devAmountLabel.setText(String(format: "%d", playerStats.devs))
        self.pcAmountLabel.setText(String(format: "%d", playerStats.pcs))
        self.devPriceLabel.setText("D$ " + String(WatchUIServices.dolStringFormat(dol: marketStats.devsPrice)))
        self.pcPriceLabel.setText("D$ " + String(WatchUIServices.dolStringFormat(dol: marketStats.pcPrice)))
    }
    
}
