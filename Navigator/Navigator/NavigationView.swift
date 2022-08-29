//
//  NavigationView.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/5/21.
//

import Lux
import Resolver
import SwiftUI

struct NavigationViewActionItem {
    var icon: String?
    var title: String?
    var action: () -> Void
}

struct NavigationView<Content: View, TABS: NavigatorTabItem>: View {
    var title: String?
    var titleTweak: Lux.Tweak = .titleLayout
    var rightActions = [NavigationViewActionItem]()
    let viewBuilder: () -> Content

    @InjectedObject var nav: Navigator<TABS>

    func dismiss() {
        nav.dismissSheet()
    }

    func goBack() {
        nav.popController()
    }

    var body: some View {
        ZStack {
            viewBuilder()
                .padding(.top, NavigatorUI.NavBarHeight)

            Row {
                Group{
                nav.displayCloseButton ?
                    Button(action: dismiss) {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .padding(.horizontal)
                    }
                    .lux
                    .tweak(.canvasSurface)
                    .style(.layoutBlock, .iconLarge)
                    .view
                    : nav.displayBackButton ?
                    Button(action: goBack) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .padding(.horizontal)
                    }
                    .lux.view
                    : Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .opacity(0.01)
                    .lux.view
                }.accessibility(identifier:"Navigation Back")

                if let title = title {
                    Text(title)
                        .lux
                        .tweak(titleTweak)
                        .style(.text)
                        .view
                }

                Spacer()

                ForEach(Array(rightActions.enumerated()), id: \.offset) { _, item in

                    Button(action: item.action) {
                        if let icon = item.icon {
                            Image(systemName: icon)
                                .imageScale(.large)
                        }
                        if let title = item.title {
                            Text(title)
                                .lux
                                .tweak(.headlineLayout)
                                .style(.text)
                                .view
                        }
                    }
                    .lux
                    .tweak(.canvasSurface)
                    .style(.layoutBlock, .iconLarge)
                    .feature(.padding)
                    .view
                }
            }
            .lux
            .tweak(.canvasSurface)
            .style(.bar)
            .view
            .frame(height: NavigatorUI.NavBarHeight)
            .frame(maxHeight: .greatestFiniteMagnitude, alignment: .top)
        }
    }
}
