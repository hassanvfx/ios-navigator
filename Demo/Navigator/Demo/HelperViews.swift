//
//  HelperViews.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//

import Lux
import NavigatorLib
import CoreUIKit
import Resolver
import SwiftUI

struct HomeView: View {
    @InjectedObject var nav: Navigator<DemoTabs>
    func pushTestController() {
        let view = NavView( title: "Test Controller") { ChildView() }

        let host = UIHostingController(rootView: view)
        host.view.layoutMargins = .zero
        nav.push(controller: host)
    }

    var body: some View {
        Column {
            Button(action: pushTestController) {
                Text("Push Test Controller")
            }
            .buttonStyle(PlainButtonStyle())
            .accessibility(identifier: "Action Button")
        }
    }
}

struct ChildView: View {
    @InjectedObject var nav: Navigator<DemoTabs>
    func pushTestController() {
        let view = NavView( title: "Test Controller",leftAction: .back) { ChildView() }
        let host = UIHostingController(rootView: view)
        host.view.layoutMargins = .zero
        nav.push(controller: host)
    }

    var body: some View {
        Column {
            Button(action: pushTestController) {
                Text("Push Test Controller Again")
            }
            .buttonStyle(PlainButtonStyle())
            .accessibility(identifier: "Nested Action Button")
        }
    }
}

struct StoreView: View {
    @InjectedObject var nav: Navigator<DemoTabs>
    func presentController() {
        let view = NavView( title: "Presented",leftAction: .dismiss) { ChildView() }
        let host = UIHostingController(rootView: view)
        host.view.layoutMargins = .zero
        nav.present(sheet: host)
    }

    var body: some View {
        Column {
            Button(action: presentController) {
                Text("Present Test Controller")
            }
        }
    }
}
