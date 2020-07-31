//
// Created by mac on 2019-07-29.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

class PaddedImageView: UIImageView {
    override var alignmentRectInsets: UIEdgeInsets {
        return UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
    }
}