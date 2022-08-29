//
//  TabBarController+Sheet.swift
//  spree3d
//
//  Created by hassan uriostegui on 2/5/21.
//

import SwiftUI

extension TabBarController {
    func linkSheet() {
        cancellables.append(
            nav.$sheetController.sink(receiveValue: { [weak self] controller in
                self?.present(controller: controller)
            })
        )
    }
}



extension TabBarController {
    func present(controller: UIViewController?) {
        dismissSheet { [weak self] in
            guard let self = self else { return }
            guard let controller = controller else { return }

            let navController = UINavigationController(rootViewController: controller)

            navController.navigationBar.isHidden = true
            navController.delegate = self
            navController.modalPresentationStyle = self.nav.modalStyle

            self.present(navController, animated: true)
            navController.transitioningDelegate = self
            self.sheetNavigator = navController
            self.nav.syncOnNavigationChange()
        }
    }

    func dismissSheet(completion: @escaping () -> Void) {
        let finalizer = { [weak self] in

            self?.sheetNavigator = nil
            self?.nav.syncOnNavigationChange()

            completion()
        }

        guard presentedViewController != nil else {
            finalizer()
            return
        }

        dismiss(animated: true, completion: finalizer)
    }
}
