//
// Created by mac on 2019-07-06.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

class AppPageViewController: UIPageViewController {
    private var pages: [UIViewController]!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(
            transitionStyle style: UIPageViewController.TransitionStyle,
            navigationOrientation: UIPageViewController.NavigationOrientation,
            options: [UIPageViewController.OptionsKey : Any]? = nil,
            pages: [UIViewController]
    ) {
        super.init(
                transitionStyle: style,
                navigationOrientation: navigationOrientation,
                options: options
        )
        self.pages = pages;
    }

}