//
//  TabBarController+Representable.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/7/21.
//

import SwiftUI

extension TabBarController {
    struct RepresentableView: UIViewControllerRepresentable {
        func makeUIViewController(context _: UIViewControllerRepresentableContext<RepresentableView>) -> TabBarController {
            TabBarController()
        }

        static func dismantleUIViewController(controller: TabBarController, coordinator _: ()) {
            controller.cancelObservers()
        }

        func updateUIViewController(_: TabBarController,
                                    context _: UIViewControllerRepresentableContext<RepresentableView>)
        {}
    }
}
