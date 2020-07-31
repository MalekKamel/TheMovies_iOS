//
// Created by mac on 2019-07-05.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

extension UIStackView {

    func addBackground(
            color: UIColor,
            cornerRadius: Double,
            padding: Double = 0
    ) {
        viewWithTag(1234)?.removeFromSuperview()

        let subview = UIView(frame: bounds)
        subview.tag = 1234
        subview.backgroundColor = color
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        subview.cornerRadius = CGFloat(cornerRadius)
        subview.bounds = subview.frame.insetBy(dx: CGFloat(-padding), dy: CGFloat(-padding))
        insertSubview(subview, at: 0)

        subview.layoutIfNeeded()
        layoutIfNeeded()
    }

}