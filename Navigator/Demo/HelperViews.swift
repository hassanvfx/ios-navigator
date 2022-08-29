//
//  HelperViews.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//

import Lux
import Resolver
import SwiftUI
struct HomeView: View {
    @InjectedObject var nav: Navigator<DemoTabs>
    func pushTestController() {
        let view = NavigatorView<AnyView, DemoTabs>(title: "Test Controller") { ChildView().lux.view }.lux.view
        let host = UIHostingController<AnyView>(rootView: view)
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
        let view = NavigatorView<AnyView, DemoTabs>(title: "Test Controller") { ChildView().lux.view }.lux.view
        let host = UIHostingController<AnyView>(rootView: view)
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
        let view = NavigatorView<AnyView, DemoTabs>(title: "Test Controller") { ChildView().lux.view }.lux.view
        let host = UIHostingController<AnyView>(rootView: view)
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
