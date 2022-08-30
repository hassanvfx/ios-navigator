//
//  NavigationView.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/5/21.
//

import Lux
import Resolver
import SwiftUI

public struct NavigatorActionItem {
    var icon: String?
    var title: String?
    var action: () -> Void
    public init( icon: String?,
                title: String?,
                action: @escaping () -> Void){
        self.icon = icon
        self.title = title
        self.action = action
    }
}

public struct NavigatorView<CONTENT: View, TABS: NavigatorTabItem>: View {
    var title: String?
    var titleTweak: Lux.Tweak = .titleLayout
    var rightActions = [NavigatorActionItem]()
    var viewBuilder: (() -> CONTENT)?

    @InjectedObject var nav: Navigator<TABS>
    public init(title:String? = nil,
                titleTweak: Lux.Tweak = .titleLayout,
                rightActions: [NavigatorActionItem] = [],
                viewBuilder: (() -> CONTENT)? = nil){
    
        self.title = title
        self.titleTweak = titleTweak
        self.rightActions = rightActions
        self.viewBuilder = viewBuilder
    }
    func dismiss() {
        nav.dismissSheet()
    }

    func goBack() {
        nav.popController()
    }

    public var body: some View {
        ZStack {
            viewBuilder?()
                .padding(.top, NavigatorUI.NavBarHeight)

            Row {
                Group {
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
                }.accessibility(identifier: "Navigation Back")

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
