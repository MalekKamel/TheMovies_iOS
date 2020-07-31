//
// Created by mac on 2019-07-28.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

extension UINavigationController {

    func removeBackStack() {
        self.navigationController!.viewControllers = []
    }

}