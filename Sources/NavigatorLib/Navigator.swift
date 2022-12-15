//
//  Coordinator+API+navigation.swift
//  spree3d
//
//  Created by hassan uriostegui on 1/21/21.
//

import Combine
import SwiftUI
import UIKit

enum NavigatorUI {
    static let TabBarHeight: CGFloat = 66
    static let NavBarHeight: CGFloat = 66
    static let NavBarLargeHeight: CGFloat = 122
}

public class Navigator<TABS: NavigatorTabItem>: ObservableObject, NavigatorProtocol {
    @Published public var tab: TABS?
    @Published public var sheetController: UIViewController?
    @Published public var modalStyle: UIModalPresentationStyle = .pageSheet
    @Published public var stack = [UIViewController]()
    @Published public var animateTabBar = true

    internal var coreUIKitObserver:NSObjectProtocol?
    public weak var tabController: TabNavViewController<TABS>?
   
    public init() {
        observeCoreUIKitNavigationEvents()
    }
    deinit {
        stopObservingCoreUIKitNavigationEvents()
    }
    public var navController: UINavigationController? {
        tabController?.currentNavigator
    }
}

public extension Navigator {
    /// The following dynamically reflects the currently acitve stack from the active UINavigationController
    func syncOnNavigationChange() {
        DispatchQueue.main.async {
            self.stack = self.navController?.viewControllers ?? []
        }
    }
}
