//
// Created by mac on 2019-07-04.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

extension UIPageViewController {

    func moveToPage(page: UIViewController) {
        self.setViewControllers(
                [page],
                direction: .forward,
                animated: true,
                completion: nil
        )
    }

}