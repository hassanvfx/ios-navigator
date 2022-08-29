//
//  Navigator+Interface.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//

import SwiftUI

public extension Navigator {
    var displayBackButton: Bool {
        stack.count > 1
    }

    var displayCloseButton: Bool {
        displayBackButton == false &&
            sheetController != nil
    }
    
    var displayTabbar: Bool {
        (animateTabBar == false) ||
            stack.count <= 1
            && sheetController == nil
    }
}

// MARK: NAVIGATION

public extension Navigator {
    func push(controller: UIViewController) {
        guard let nav = navController else {
            return
        }

        DispatchQueue.main.async {
            nav.pushViewController(controller, animated: true)
        }
    }

    func popController(animated: Bool = true) {
        guard let nav = navController else {
            return
        }

        DispatchQueue.main.async {
            nav.popViewController(animated: animated)
        }
    }

    func popToRoot(animated: Bool = true) {
        guard let nav = navController else {
            return
        }
        dismissSheet()
        DispatchQueue.main.async {
            nav.popToRootViewController(animated: animated)
        }
    }
}

public extension Navigator {
    func removeStackedController(viewId: Int) {
        guard let nav = navController else {
            return
        }
        nav.viewControllers = nav.viewControllers.filter { $0.view.tag != viewId }
        syncOnNavigationChange()
    }
}

// MARK: TABBAR

public extension Navigator {
    func link(tabBar controller: TabBarController<TABS>) {
        tabController = controller
    }
}

public extension Navigator {
    func set(tab: Int) {
        guard
            tabController?.selectedIndex != tab,
            let index = tabController?.selectedIndex
        else {
            return
        }

        let tabItem = TABS.item(idx: index)
        if let tabAction = tabItem.tapOverride {
            tabAction()
            return
        }

        tabController?.selectedIndex = tab
    }
}

// MARK: SHEETS

public extension Navigator {
    func dismissSheet() {
        DispatchQueue.main.async {
            self.sheetController = nil
        }
    }

    func present(sheet content: UIViewController) {
        DispatchQueue.main.async {
            self.sheetController = content
        }
    }
}
