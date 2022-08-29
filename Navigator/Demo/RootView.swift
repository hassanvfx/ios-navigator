//
//  ContentView.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//

import Lux
import Resolver
import SwiftUI

struct RootView: View {
    @InjectedObject var nav: Navigator<DemoTabs>

    var body: some View {
        ZStack {
            TabBarController<DemoTabs>.RepresentableView()
                .edgesIgnoringSafeArea(.all)

            TabBarView()
        }
        .lux
        .tweak(.canvasSurface)
        .style(.panel)
        .view
    }
}
