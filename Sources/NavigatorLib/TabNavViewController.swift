//
//  TabBarController.swift

//
//  Created by hassan uriostegui on 2/3/21.
//

import Combine
import SwiftUI

public class TabNavViewController<TABS: NavigatorTabItem>: UITabBarController, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate {
    var nav: Navigator<TABS>
    weak var sheetNavigator: UINavigationController?
    var cancellables: [AnyCancellable] = []

    init(nav: Navigator<TABS>) {
        self.nav = nav
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

    // MARK: PRESENTATION

    public func animationController(forDismissed _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        nav.dismissSheet()
        nav.syncOnNavigationChange()
        return nil
    }
}

public extension TabNavViewController {
    func linkAsNavigationController<SomeView: View>(root view: SomeView) -> UINavigationController {
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
