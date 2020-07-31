//
// Created by Apple on 29/07/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

public struct MoviesRequest {
    public let search: String
    public let nextPage: Int

    public init(search: String = "", nextPage: Int = 1) {
        self.search = search
        self.nextPage = nextPage
    }
}

