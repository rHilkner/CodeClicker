//
//  ViewControllerFactory.swift
//  DevClicker
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation
import UIKit

/// Enum containing view controller identifiers
public enum ViewControllerType: String {
    case codingViewController = "CodingViewController"
    case upgradesViewController = "UpgradesViewController"
}

class ViewControllerFactory {

    /// Instantiates a view controller from given type
    static func instantiateViewController(ofType type: ViewControllerType) -> UIViewController {
        let storyboard = StoryboardFactory.instantiateStoryboard(type: StoryboardType.main)
        let viewController: UIViewController
        let viewControllerIdentifier = type.rawValue

        switch type {
        case .codingViewController:
            viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        case .upgradesViewController:
            viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        }

        return viewController
    }

}
