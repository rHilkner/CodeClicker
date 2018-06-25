//
//  ViewControllerFactory.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation
import UIKit

public enum ViewControllerType: String {
    case codingViewController = "CodingViewController"
    case upgradesViewController = "UpgradesViewController"
}

class ViewControllerFactory {

    static func instantiateViewController(ofType type: ViewControllerType) -> UIViewController {
        let storyboard = StoryboardFactory.instantiateStoryboard(type: StoryboardType.main)
        let viewController: UIViewController

        switch type {
        case .codingViewController:
            viewController = storyboard.instantiateViewController(withIdentifier: ViewControllerType.codingViewController.rawValue)
        case .upgradesViewController:
            viewController = storyboard.instantiateViewController(withIdentifier: ViewControllerType.upgradesViewController.rawValue)
        }

        return viewController
    }

}
