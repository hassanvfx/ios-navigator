//
//  ContentView.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//

import Lux
import Resolver
import SwiftUI
import NavigatorLib

struct RootView: View {
    @InjectedObject var nav: Navigator<DemoTabs>

    var body: some View {
        ZStack {
            TabNavViewController<DemoTabs>.RepresentableView()
                .edgesIgnoringSafeArea(.all)

            NavigatorTabBarView<DemoTabs>()
        }
        .lux
        .tweak(.canvasSurface)
        .style(.panel)
        .view
    }
}
