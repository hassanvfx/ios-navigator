//
//  TabBarController+Navigator.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/7/21.
//

import UIKit

extension TabBarController {
    var currentNavigator: UINavigationController {
        if let sheetNavigator = self.sheetNavigator {
            return sheetNavigator
        }
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else {
            fatalError()
        }
        controller.navigationBar.isHidden = true
        controller.delegate = self

        return controller
    }
}
