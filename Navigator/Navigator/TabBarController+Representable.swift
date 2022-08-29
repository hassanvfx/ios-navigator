//
//  TabBarController+Representable.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/7/21.
//

import SwiftUI

extension TabNavViewController {
    struct RepresentableView: UIViewControllerRepresentable {
        func makeUIViewController(context _: UIViewControllerRepresentableContext<RepresentableView>) -> TabNavViewController {
            TabNavViewController()
        }

        static func dismantleUIViewController(controller: TabNavViewController, coordinator _: ()) {
            controller.cancelObservers()
        }

        func updateUIViewController(_: TabNavViewController,
                                    context _: UIViewControllerRepresentableContext<RepresentableView>)
        {}
    }
}
