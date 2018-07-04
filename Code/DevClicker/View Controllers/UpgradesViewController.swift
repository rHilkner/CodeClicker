//
//  File.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 26/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import UIKit

class UpgradesViewController: UIViewController {

    var upgradesAvailable: [Upgrade] = []
    @IBOutlet weak var tableView: UITableView!

    override func viewDidAppear(_ animated: Bool) {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.refreshTableViewContent()
    }

    /// Refreshes table view with current game stats
    func refreshTableViewContent() {
        self.upgradesAvailable = AppShared.game.gameStats.upgradesAvailable
        self.tableView.reloadData()
    }

    @IBAction func goToCodingView() {
        // TODO: set animation correctly
        self.dismiss(animated: false, completion: nil)
    }

}

extension UpgradesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

    /// Returns number of cells in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.upgradesAvailable.count
    }

    /// Populates table view with cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let upgrade = self.upgradesAvailable[indexPath.row]
        let cell = CellFactory.upgradeCell(tableView: tableView, upgrade: upgrade)
        return cell
    }

}

// MARK: - Table view delegate
extension UpgradesViewController: UITableViewDelegate {

    /// Buys an upgrade when a table view cell (upgrade) is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let upgradeSelected = self.upgradesAvailable[indexPath.row]
        guard UpgradeServices.buy(upgrade: upgradeSelected) else {
            print("-> INFO: Couldn't buy the selected upgrade.")
            return
        }
        self.refreshTableViewContent()
    }

}
