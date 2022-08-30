//
//  NavigationBarView.swift
//  spree3d
//
//  Created by hassan uriostegui on 3/10/22.
//

import Lux
import SwiftUI

struct NavigatorBarView<TABS: NavigatorTabItem>: View {
    @ObservedObject var nav: Navigator<TABS>
    var title: String?
    var titleTweak: Lux.Tweak = .titleLayout
    var rightActions = [NavigatorActionItem]()
    public init(nav: Navigator<TABS>,
                title: String? = nil,
                titleTweak: Lux.Tweak = .titleLayout,
                rightActions: [NavigatorActionItem] = [])
    {
        self.nav = nav
        self.title = title
        self.titleTweak = titleTweak
        self.rightActions = rightActions
    }

    func dismiss() {
        nav.dismissSheet()
    }

    func goBack() {
        nav.popController()
    }

    var body: some View {
        Row {
            Group {
                nav.displayCloseButton ?
                    Button(action: dismiss) {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                    }
                    .lux
                    .feature(.secondaryOpacity)
                    .feature(.secondaryOpacity)
                    .view
                    : nav.displayBackButton ?
                    Button(action: goBack) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                    }
                    .lux
                    .feature(.secondaryOpacity)
                    .feature(.secondaryOpacity)
                    .view
                    : nil
            }.accessibility(identifier: "Navigation Back")
            Spacer()

            ForEach(Array(rightActions.enumerated()), id: \.offset) { _, item in

                Button(action: item.action) {
                    Row {
                        if let title = item.title {
                            Text(title)
                                .bold()
                                .lux
                                .tweak(.captionLayout)
                                .style(.text)
                                .view
                        }
                        if let icon = item.icon {
                            Image(systemName: icon)
                                .imageScale(.large)
                        }
                    }
                }
                .lux
                .view
                .padding(.leading, lux.spec.padding.half)
                .padding(.vertical, lux.spec.padding.half)
            }
        }
        .overlay(
            Row {
                if let title = title {
                    Text(title)
                        .bold()
                        .lux
                        .tweak(titleTweak)
                        .style(.text)
                        .feature(.secondaryOpacity)
                        .view
                }
            }
            .frame(maxWidth: .greatestFiniteMagnitude)
        )
        .lux
        .tweak(.canvasSurface)
        .style(.bar)
        .view
        .padding(.horizontal, lux.spec.padding.base * 1.5)
        .frame(height: NavigatorUI.NavBarHeight)
    }
}
