//
//  Navigator+Factory.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/10/21.
//

import SwiftUI

public protocol NavigatorTabItem: CaseIterable {
    associatedtype InnerItem: NavigatorTabItem
    static var defaultItem: InnerItem { get }
    static var allItems: [InnerItem] { get }
    static func item(idx: Int) -> InnerItem

    var intValue: Int { get }
    var displayName: String { get }
    var image: UIImage { get }
    var imageActive: UIImage { get }
    var tapOverride: (() -> Void)? { get }
    func navFactory(tabController: TabBarController<InnerItem>) -> () -> UINavigationController
}

