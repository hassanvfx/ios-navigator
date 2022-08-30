//
//  TabBarController+Representable.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/7/21.
//

import SwiftUI

public extension TabNavViewController {
    struct DisplayView<TABS: NavigatorTabItem>: UIViewControllerRepresentable {
        var nav: Navigator<TABS>
        public init(nav: Navigator<TABS>) {
            self.nav = nav
        }

        public func makeUIViewController(context _: UIViewControllerRepresentableContext<DisplayView>) -> TabNavViewController<TABS> {
            TabNavViewController<TABS>(nav: nav)
        }

        public static func dismantleUIViewController(controller: TabNavViewController<TABS>, coordinator _: ()) {
            controller.cancelObservers()
        }

        public func updateUIViewController(_: TabNavViewController<TABS>,
                                           context _: UIViewControllerRepresentableContext<DisplayView>)
        {}
    }
}
