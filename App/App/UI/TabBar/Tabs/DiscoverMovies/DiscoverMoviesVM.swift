//
// Created by Shaban Kamel on 04/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import RxRequester
import Data
import Presentation
import RxSwift

class DiscoverMoviesVM: ViewModelProtocol {
    var requester: AppRequester!
    var dm: DataManager

    public init(rxRequester: AppRequester, dm: DataManager) {
        self.requester = rxRequester
        self.dm = dm
    }

    func discoverMovies(options: RequestOptions, request: MoviesRequest) -> Single<[Movie]> {
         requester.request(options: options, singleRequest: {
            self.dm.moviesRepo.discoverMovies(request: request)
        })
    }
}
