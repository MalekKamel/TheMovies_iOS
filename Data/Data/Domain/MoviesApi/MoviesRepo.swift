//
// Created by Shaban Kamel on 03/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxSwift

public class MoviesRepo {
    let src: MoviesRemoteDataSrc

    static func create() -> MoviesRepo {
        MoviesRepo(src: MoviesRemoteDataSrc(api: authApi))
    }

    init(src: MoviesRemoteDataSrc) {
        self.src = src
    }

    public func discoverMovies(request: MoviesRequest) -> Single<MoviesResponse> {
        src.discoverMovies(request: request)
    }

    public func searchMovies(request: MoviesRequest) -> Single<MoviesResponse> {
        src.searchMovies(request: request)
    }

}