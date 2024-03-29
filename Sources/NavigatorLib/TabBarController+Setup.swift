//
//  TabBarController+Setup.swift

//
//  Created by hassan uriostegui on 2/3/21.
//

import SwiftUI

extension TabNavViewController {
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

extension TabNavViewController {
    func setupTabs() {
        let factories = TABS.allItems.map { $0.navFactory(tabController: self as! TabNavViewController<TABS.InnerItem.InnerItem>) }
        viewControllers = factories.map { $0() }
        tabBar.isHidden = true
    }
}
