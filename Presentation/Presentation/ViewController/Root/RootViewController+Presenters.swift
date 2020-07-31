//
// Created by mac on 2019-03-18.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit

public extension RootViewController {

    // Use responsibly
    public class var topPresentedViewController: UIViewController {
        let rootViewController = UIApplication.shared.keyWindow!.rootViewController!
        return topPresentedViewController(of: rootViewController)
    }

    private class func topPresentedViewController(of viewController: UIViewController) -> UIViewController {
        if let viewController = viewController.presentedViewController {
            return topPresentedViewController(of: viewController)
        }
        return viewController
    }

}
