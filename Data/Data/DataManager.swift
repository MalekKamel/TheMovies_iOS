//
// Created by Shaban Kamel on 04/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxRequester

public class DataManager {
    public lazy var moviesRepo: MoviesRepo = {
        MoviesRepo.create()
    }()

    public static func create() -> DataManager { DataManager() }
}
