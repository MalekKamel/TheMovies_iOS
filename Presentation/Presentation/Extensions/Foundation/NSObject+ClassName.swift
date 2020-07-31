//
// Created by Shaban Kamel on 13/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

public extension NSObject {
    var className: String {
        NSStringFromClass(type(of: self)).components(separatedBy: ".").last ?? ""
    }

    class var className: String {
        NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}