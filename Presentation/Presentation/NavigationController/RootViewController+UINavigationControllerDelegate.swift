//
// Created by mac on 2019-03-18.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

extension NavigationController: UINavigationControllerDelegate {

    public func navigationController(
            _ navigationController: UINavigationController,
            willShow viewController: UIViewController,
            animated: Bool
    ) {

        lastViewController?.viewWillDisappear(animated)
        viewController.viewWillAppear(animated)
        lastViewController = viewController

        applyAppearance(for: viewController, animated: true)
    }

    public func navigationController(
            _ navigationController: UINavigationController,
            didShow viewController: UIViewController,
            animated: Bool) {
        lastViewController?.viewDidDisappear(animated)
        viewController.viewDidAppear(animated)
        lastViewController = viewController
    }

}
