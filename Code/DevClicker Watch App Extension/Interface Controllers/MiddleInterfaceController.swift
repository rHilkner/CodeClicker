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
    @IBOutlet var locRateLabel: WKInterfaceLabel!
    @IBOutlet var dolRateLabel: WKInterfaceLabel!
    @IBOutlet var devAmountLabel: WKInterfaceLabel!
    @IBOutlet var mktLvlLabel: WKInterfaceLabel!
    @IBOutlet var slider: WKInterfaceSlider!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        self.becomeCurrentPage()
        
        AppShared.game.gameDelegate.append(self)
    }

    @IBAction func codeLocTapped(_ sender: Any) {
        PlayerActionsServices.codeLocTapped()
    }
    
    @IBAction func sliderChanged(_ value: Float) {
        AppShared.game.gameStats.playerStats.coffeeMktRate = Double(value)
    }
}

extension MiddleInterfaceController: GameDelegate {
    
    func updateStats() {
        let playerStats = AppShared.game.gameStats.playerStats
        
        self.dolLabel.setText(String(WatchUIServices.dolStringFormat(dol: playerStats.dols)))
        self.locLabel.setText(String(WatchUIServices.locStringFormat(loc: playerStats.loc)))
        self.locRateLabel.setText(String(format: "%.1f", CodeServices.calculateDevLocProduction(game: AppShared.game)))
        self.dolRateLabel.setText(String(format: "%.1f", MarketServices.calculateLocDemand(game: AppShared.game)))
        self.devAmountLabel.setText(String(format: "%d", playerStats.devs))
        self.mktLvlLabel.setText(String(format: "%d", playerStats.marketingLevel))
    }
    
}
