//
// Created by Sha on 2019-03-01.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundImage: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        setCorners()
    }

    private func setCorners() {
        layer.cornerRadius = frame.size.width / 2;
        clipsToBounds = true;
    }

}