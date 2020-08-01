//
// Created by Shaban Kamel on 31/07/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

public struct PagingInfo {
    public var start: Int
    public var limit: Int

    public init(start: Int, limit: Int = 30) {
        self.start = start
        self.limit = limit
    }
}