//
//  ViewController.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 23/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import UIKit

class CodingViewController: UIViewController {

    // Labels
    @IBOutlet weak var dolLabel: UILabel!
    @IBOutlet weak var locLabel: UILabel!
    @IBOutlet weak var numDevsLabel: UILabel!
    @IBOutlet weak var locsPerSecLabel: UILabel!
    @IBOutlet weak var bizdevsLabel: UILabel!
    @IBOutlet weak var sellPerSecLabel: UILabel!

    // Game variable
    var game: Game!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard game != nil else {
            print("-> ERROR: Game object in Coding VC is nil.")
            return
        }

        // Setting correct labels
        self.dolLabel.text = ""
        self.dolLabel.text = ""
        self.dolLabel.text = ""
    }

    @IBAction func codeButtonPressed() {
        PlayerActionsServices.codeLocTapped(self.game)
    }

    @IBAction func hireDevButtonPressed() {
        PlayerActionsServices.hireDevTapped(self.game)
    }

    @IBAction func hireBizdevButtonPressed() {
        PlayerActionsServices.hireBizdevTapped(self.game)
    }

}

