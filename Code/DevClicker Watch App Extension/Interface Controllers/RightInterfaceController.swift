//
//  RightInterfaceController.swift
//  DevClicker Watch App Extension
//
//  Created by Mauricio Lorenzetti on 28/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import WatchKit
import Foundation


class RightInterfaceController: WKInterfaceController {

    @IBOutlet var locLabel: WKInterfaceLabel!
    @IBOutlet var dolLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        AppShared.game.gameDelegate.append(self)
        
    }

}

extension RightInterfaceController: GameDelegate {
    
    func updateStats() {
        let playerStats = AppShared.game.gameStats.playerStats
        
        self.dolLabel.setText(String(WatchUIServices.dolStringFormat(dol: playerStats.dols)))
        self.locLabel.setText(String(WatchUIServices.locStringFormat(loc: playerStats.loc)))
    }
}

