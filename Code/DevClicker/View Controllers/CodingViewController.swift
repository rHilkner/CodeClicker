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
    @IBOutlet weak var coffeMktSlider: UISlider!
    @IBOutlet weak var numDevsLabel: UILabel!
    @IBOutlet weak var locPerSecLabel: UILabel!
    @IBOutlet weak var mktLvlLabel: UILabel!
    @IBOutlet weak var sellPerSecLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        AppShared.game.gameDelegate = self

        self.coffeMktSlider.minimumValue = 0.0
        self.coffeMktSlider.maximumValue = 2.0
        self.coffeMktSlider.addTarget(self, action: #selector(self.sliderValueChanged(sender:)), for: .valueChanged)

        self.updateStats()
    }

    override func viewWillDisappear(_ animated: Bool) {
        AppShared.game.gameDelegate = nil
    }

    @IBAction func codeButtonPressed() {
        PlayerActionsServices.codeLocTapped()
    }

    @IBAction func hireDevButtonPressed() {
        PlayerActionsServices.hireDevTapped()
    }

    @IBAction func upgradeMktButtonPressed() {
        PlayerActionsServices.upgradeMarketingTapped()
    }

}

extension CodingViewController: GameDelegate {

    func updateStats() {
        // Setting correct labels
        let playerStats = AppShared.game.playerStats

        self.dolLabel.text = String(format: "dól: D$ %.2f", playerStats.dols)
        self.locLabel.text = "Lines of Code: \(playerStats.loc) LoC"
        self.numDevsLabel.text = "#devs: \(playerStats.devs)"
        self.locPerSecLabel.text = "#loc/s: \(CodeServices.calculateDevLocProduction())"
        self.mktLvlLabel.text = "#mkt lvl: \(playerStats.marketingLevel)"
        self.sellPerSecLabel.text = "#sell/s: \(MarketServices.calculateLocDemand())"
    }

}

// UI selectors
extension CodingViewController {

    @objc func sliderValueChanged(sender: UISlider) {
        AppShared.game.playerStats.coffeeMktRate = Double(sender.value)
    }

}

