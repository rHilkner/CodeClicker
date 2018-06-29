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

    @IBOutlet var label: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        label.setText("LEFT")
        
        // Configure interface objects here.
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
