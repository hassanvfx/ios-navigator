//
//  Navigator+Interface.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//

import SwiftUI

public protocol NavigatorProtocol {
    func dismissSheet()
    func present(sheet content: UIViewController)
    func popController(animated: Bool)
    func push(controller: UIViewController)
    func popToRoot(animated: Bool)
    var displayBackButton: Bool { get }
    var displayCloseButton: Bool { get }
}

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
    func link(tabBar controller: TabNavViewController<TABS>) {
        tabController = controller
    }
}

public extension Navigator {
    func set(tab: Int) {
        let tabItem = TABS.item(idx: tab)
        if let tabAction = tabItem.tapOverride {
            DispatchQueue.main.async {
                tabAction()
            }
            return
        }

        guard tabController?.selectedIndex != tabItem.intValue else { return }
        DispatchQueue.main.async {
            self.tabController?.selectedIndex = tab
        }
       
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
