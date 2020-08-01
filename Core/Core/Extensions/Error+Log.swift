//
// Created by Apple on 01/08/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

public extension Error {
    func logAndReport() {
        print(localizedDescription)
        CrashlyticsUtil.record(error: self)
    }
}