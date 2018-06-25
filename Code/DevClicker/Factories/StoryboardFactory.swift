//
//  StoryboardFactory.swift
//  EasyDoc
//
//  Created by Rodrigo Hilkner on 25/06/18.
//  Copyright © 2018 Rodrigo Hilkner. All rights reserved.
//

import Foundation
import UIKit

public enum StoryboardType: String {

    case main = "Main"

}

class StoryboardFactory {

    static func instantiateStoryboard(type: StoryboardType) -> UIStoryboard {
        switch type {

        case .main:
            return UIStoryboard(name: StoryboardType.main.rawValue, bundle: nil)

        }
    }

}
