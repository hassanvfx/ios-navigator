//
//  TabBarController+Observer.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/3/21.
//

import SwiftUI

extension TabBarController {
    func linkObservers() {
        cancellables.append(
            nav.$tab.sink {
                [weak self]
                _ in
                self?.onTabChange()
            }
        )
        cancellables.append(
            publisher(for: \.selectedIndex)
                .sink(receiveValue: {
                    [weak self]
                    index in
                    self?.syncTabEffects(index: index)
                })
        )
    }

    func cancelObservers() {
        cancellables.forEach { $0.cancel() }
        cancellables = []
    }

    func syncTabEffects(index: Int) {
        nav.tab = TABS.item(idx: index) as? TABS
    }

    func onTabChange() {
        // todo
    }
}
