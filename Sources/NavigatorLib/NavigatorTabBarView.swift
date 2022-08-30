//
//  TabBarView.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//

import Lux
import Resolver
import SwiftUI

public struct NavigatorTabBarView<TABS:NavigatorTabItem>: View {
    @InjectedObject var nav: Navigator<TABS>
    public init(){}
    public var body: some View {
        Column {
            Spacer()
            Column {
                nav.displayTabbar ?
                    tabsView()
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
                    : nil
            }
        }
        .lux.view
    }
}

extension NavigatorTabBarView {
    func show(tab: TABS) {
        nav.set(tab: tab.intValue)
    }

    func isActive(_ tab: TABS) -> Bool {
        tab.intValue == nav.tab?.intValue
    }
}

extension NavigatorTabBarView {
    func tabsView() -> AnyView {
        Row {
            ForEach(TABS.allItems, id: \.self) { item in
                tabItem(text: item.displayName, image: Image(uiImage: item.image), imageActive: Image(uiImage: item.imageActive), active: isActive(item as! TABS)) { show(tab: item as! TABS) }
            }
            .lux
            .feature(.flexibleWidth)
            .view
        }
        .frame(height: NavigatorUI.TabBarHeight)
        .lux
        .tweak(.canvasSurface)
        .style(.bar)
        .view
    }

    var tabItemSize: CGFloat {
        18
    }

    @ViewBuilder
    func tabItem(text: String, image: Image, imageActive: Image, active: Bool, _ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Column {
                (active ? imageActive : image)
                    .resizable()
                    .frame(width: tabItemSize, height: tabItemSize, alignment: .center)
                    .lux
                    .tweak(.layoutMultiplierHalf)
                    .feature(.padding)
                    .view
                Text(text)
                    .opacity(active ? 1 : 0.75)
            }
        }
        .accessibility(identifier: "Tab \(text)")
        .lux
        .tweak(.captionLayout)
        .style(.text)
        .view
    }
}
