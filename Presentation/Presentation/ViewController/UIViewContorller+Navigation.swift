//
// Created by Shaban Kamel on 04/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import UIKit

public extension UIViewController {

    func push(animated: Bool = true) {
        rootViewController.navigate(vc: self, type: .push, animated: animated)
    }

    func add(animated: Bool = true) {
        rootViewController.navigate(vc: self, type: .add, animated: animated)
    }

    func present(animated: Bool = true) {
        rootViewController.navigate(vc: self, type: .present, animated: animated)
    }
}