//
//  TabBarController+Setup.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/3/21.
//

import SwiftUI

extension TabBarController {
    func setActiveTabBar() {
        nav.link(tabBar: self)
    }

    func setup() {
        [
            setActiveTabBar,
            setupTabs,
            linkObservers,
            linkSheet,
        ].forEach { $0() }
    }
}

extension TabBarController {
    func setupTabs() {
        let factories = TABS.allItems.map { $0.navFactory(tabController: self as! TabBarController<TABS.InnerItem.InnerItem>) }
        viewControllers = factories.map { $0() }
        tabBar.isHidden = true
    }
}
