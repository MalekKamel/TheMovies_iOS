//
// Created by mac on 2019-03-18.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit

extension NavigationController {

    func copy(viewControllers: [UIViewController]) -> NavigationController {
        guard let rootViewController = viewControllers.first else { fatalError("Must have at least one controller") }

        viewControllers.forEach {
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }

        let navigationController = NavigationController(rootViewController: rootViewController)
        navigationController.viewControllers += viewControllers.dropFirst()

        navigationController.navigationItem.titleView = navigationItem.titleView?.copy()
        navigationController.navigationItem.title = navigationItem.title
        navigationController.setNavigationBarHidden(isNavigationBarHidden, animated: false)
        navigationController.navigationItem.rightBarButtonItems = navigationItem.rightBarButtonItems
        navigationController.navigationItem.leftBarButtonItems = navigationItem.leftBarButtonItems

        return navigationController
    }

}
