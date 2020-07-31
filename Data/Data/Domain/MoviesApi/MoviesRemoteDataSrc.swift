//
// Created by Shaban Kamel on 03/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class MoviesRemoteDataSrc {
    let api: MoyaProvider<MoviesApi>

    init(api: MoyaProvider<MoviesApi>) {
        self.api = api
    }

    func discoverMovies(request: MoviesRequest) -> Single<MoviesResponse> {
        api.rx.request(.discoverMovies(request)).mapItem()
    }

    func searchMovies(request: MoviesRequest) -> Single<MoviesResponse> {
        api.rx.request(.searchMovies(request)).mapItem()
    }

}