//
//  TabBarController+Representable.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/7/21.
//

import SwiftUI

extension TabNavViewController {
    public struct RepresentableView: UIViewControllerRepresentable {
        public init(){}
        public func makeUIViewController(context _: UIViewControllerRepresentableContext<RepresentableView>) -> TabNavViewController {
            TabNavViewController()
        }

        public static func dismantleUIViewController(controller: TabNavViewController, coordinator _: ()) {
            controller.cancelObservers()
        }

        public func updateUIViewController(_: TabNavViewController,
                                    context _: UIViewControllerRepresentableContext<RepresentableView>)
        {}
    }
}
