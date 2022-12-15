//
//  NavigationView.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/5/21.
//

//import Lux
//import SwiftUI
//
//public struct NavigatorActionItem {
//    var icon: String?
//    var title: String?
//    var action: () -> Void
//    public init(icon: String?,
//                title: String?,
//                action: @escaping () -> Void)
//    {
//        self.icon = icon
//        self.title = title
//        self.action = action
//    }
//}

//public struct NavigatorView<TABS: NavigatorTabItem, CONTENT: View>: View {
//    @ObservedObject var nav: Navigator<TABS>
//    var title: String?
//    var titleTweak: Lux.Tweak = .titleLayout
//    var rightActions = [NavigatorActionItem]()
//    let content: () -> CONTENT
//
//    public init(nav: Navigator<TABS>,
//                title: String? = nil,
//                titleTweak: Lux.Tweak = .titleLayout,
//                rightActions: [NavigatorActionItem] = [],
//                content: @escaping () -> CONTENT)
//    {
//        self.nav = nav
//        self.title = title
//        self.titleTweak = titleTweak
//        self.rightActions = rightActions
//        self.content = content
//    }
//
//    func dismiss() {
//        nav.dismissSheet()
//    }
//
//    func goBack() {
//        nav.popController()
//    }
//
//    public var body: some View {
//        ZStack {
//            content()
//                .padding(.top, NavigatorUI.NavBarHeight)
//
//            Column {
//                NavigatorBarView<TABS>(nav: nav, title: title, titleTweak: titleTweak, rightActions: rightActions)
//
//                Spacer()
//            }
//        }
//    }
//}
