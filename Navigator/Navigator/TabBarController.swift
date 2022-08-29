//
//  TabBarController.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/3/21.
//

import Combine
import Resolver
import SwiftUI

public class TabBarController<TABS: NavigatorTabItem>: UITabBarController, UINavigationControllerDelegate {
    @Injected var nav: Navigator<TABS>
    weak var sheetNavigator: UINavigationController?

    var cancellables: [AnyCancellable] = []

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setup()
    }

    public func navigationController(_ navController: UINavigationController, willShow _: UIViewController, animated _: Bool) {
        nav.syncOnNavigationChange()
        navController.navigationBar.isHidden = true
    }

    public func navigationController(_ navController: UINavigationController, didShow _: UIViewController, animated _: Bool) {
        nav.syncOnNavigationChange()
        navController.navigationBar.isHidden = true
        nav.syncOnNavigationChange()
    }
}

public extension TabBarController {
    func linkAsNavigationController(root view: AnyView) -> UINavigationController {
        func prepare<E: View>(view: E) -> AnyView {
            view
                .padding(.bottom, NavigatorUI.TabBarHeight)
                .edgesIgnoringSafeArea(.top).lux.view
        }
        let root = UIHostingController<AnyView>(rootView: prepare(view: view))
        root.view.layoutMargins = .zero
        root.view.backgroundColor = .clear
        let navigationController = UINavigationController(rootViewController: root)

        navigationController.navigationBar.isHidden = true
        navigationController.delegate = self

        return navigationController
    }
}
