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

    // Buttons
    @IBOutlet weak var hireDevButton: UIButton!
    @IBOutlet weak var upgradeMktLvlButton: UIButton!

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

    // TODO: delete this on final version
    @IBAction func resetGameButtonPressed() {
        AppShared.game = Game()
        AppShared.game.executeGameLoop()
        self.updateStats()
    }

}

extension CodingViewController: GameDelegate {

    func updateStats() {
        // Setting correct data to labels
        let playerStats = AppShared.game.playerStats
        let marketStats = AppShared.game.marketStats

        self.dolLabel.text = String(format: "dól: D$ %.2f", playerStats.dols)
        self.locLabel.text = "Lines of Code: \(playerStats.loc) LoC"
        self.numDevsLabel.text = "#devs: \(playerStats.devs)"
        self.locPerSecLabel.text = String(format: "#loc/s: (%.2f)", CodeServices.calculateDevLocProduction())
        self.mktLvlLabel.text = "#mkt lvl: \(playerStats.marketingLevel)"
        self.sellPerSecLabel.text = String(format: "#sell/s: (%.2f)", MarketServices.calculateLocDemand())

        // Setting correct prices to button titles
        self.hireDevButton.setTitle(String(format: "+dev\n(D$ %.2f)", marketStats.devsPrice),
                                    for: .normal)
        self.upgradeMktLvlButton.setTitle(String(format: "+mktlvl\n(D$ %.2f)", marketStats.upgradeMktPrice),
                                          for: .normal)
    }

}

// UI selectors
extension CodingViewController {

    @objc func sliderValueChanged(sender: UISlider) {
        AppShared.game.playerStats.coffeeMktRate = Double(sender.value)
    }

}
