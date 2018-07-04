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
    @IBOutlet weak var pcCountLabel: UILabel!
    @IBOutlet weak var coffeMktSlider: UISlider!
    @IBOutlet weak var numDevsLabel: UILabel!
    @IBOutlet weak var locPerSecLabel: UILabel!
    @IBOutlet weak var mktLvlLabel: UILabel!
    @IBOutlet weak var sellPerSecLabel: UILabel!

    // Buttons
    @IBOutlet weak var hireDevButton: UIButton!
    @IBOutlet weak var upgradeMktLvlButton: UIButton!
    @IBOutlet weak var addPcButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coffeMktSlider.minimumValue = 0.0
        self.coffeMktSlider.maximumValue = 2.0
        self.coffeMktSlider.value = Float(AppShared.game.gameStats.playerStats.coffeeMktRate)
        self.coffeMktSlider.addTarget(self, action: #selector(self.sliderValueChanged(sender:)), for: .valueChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        AppShared.game.gameDelegate.append(self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        AppShared.game.gameDelegate.removeAll()
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

    @IBAction func addPcButtonPressed() {
        PlayerActionsServices.addPcTapped()
    }

    // TODO: delete this on final version
    @IBAction func resetGameButtonPressed() {
        AppShared.game = Game()
        AppShared.game.executeGameLoop()
        self.updateStats()
        self.coffeMktSlider.value = Float(AppShared.game.gameStats.playerStats.coffeeMktRate)
    }

}

extension CodingViewController: GameDelegate {

    func updateStats() {
        // Setting correct data to labels
        let playerStats = AppShared.game.gameStats.playerStats

        self.dolLabel.text = IosUIServices.dolStringFormat(dol: playerStats.dol)
        self.locLabel.text = IosUIServices.locStringFormat(loc: playerStats.loc)
        self.pcCountLabel.text = "\(playerStats.pcs)"
        self.numDevsLabel.text = "\(playerStats.devs)"
        self.locPerSecLabel.text = String(format: "%.2f", CodeServices.calculateDevLocProduction(game: AppShared.game))
        self.mktLvlLabel.text = "\(playerStats.marketingLevel)"
        self.sellPerSecLabel.text = String(format: "%.2f", MarketServices.calculateLocDemand(game: AppShared.game))

        // Setting correct prices to button titles
//        self.hireDevButton.setTitle(String(format: "+dev\n(D$ %.2f)", marketStats.devsPrice),
//                                    for: .normal)
//        self.upgradeMktLvlButton.setTitle(String(format: "+mktlvl\n(D$ %.2f)", marketStats.upgradeMktPrice),
//                                          for: .normal)
//        self.addPcButton.setTitle(String(format: "+PC (D$ %.2f): %d", marketStats.pcPrice, playerStats.pcs),
//                                  for: .normal)
    }

}

// UI selectors
extension CodingViewController {

    @objc func sliderValueChanged(sender: UISlider) {
        AppShared.game.gameStats.playerStats.coffeeMktRate = Double(sender.value)
    }

}
