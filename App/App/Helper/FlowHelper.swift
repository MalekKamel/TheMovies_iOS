//
// Created by Shaban Kamel on 10/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import UIKit
import Presentation

class FlowHelper {

    static func setupFlow(window: UIWindow?) {
        let root = RootViewController()
        root.window = window
        window?.rootViewController = root
        rootViewController = root
        rootViewController.initialViewController = { SplashVCBuilder.make() }
        window?.makeKeyAndVisible()
    }
}
