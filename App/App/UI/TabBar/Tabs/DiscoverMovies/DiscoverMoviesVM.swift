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

    func discoverMovies(request: MoviesRequest = MoviesRequest()) -> Single<MoviesResponse> {
        requester.request(singleRequest: {
            self.dm.moviesRepo.discoverMovies(request: request)
        })
    }
}
