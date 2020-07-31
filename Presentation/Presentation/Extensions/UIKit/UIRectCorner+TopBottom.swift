//
// Created by mac on 2019-03-03.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit

extension UIRectCorner {

    static var all: UIRectCorner {
        return [.topLeft, .topRight, .bottomLeft, .bottomRight]
    }

     static var top: UIRectCorner {
        return [.topLeft, .topRight]
    }

    static var bottom: UIRectCorner {
        return [.bottomLeft, .bottomRight]
    }

}