//
// Created by Shaban Kamel on 04/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import RxRequester
import Data
import Presentation
import RxSwift

class SearchMoviesVM: ViewModelProtocol {
    var requester: AppRequester!
    var dm: DataManager

    public init(rxRequester: AppRequester, dm: DataManager) {
        self.requester = rxRequester
        self.dm = dm
    }

    func isValidSearch(query: String?, type: LoadType) -> Bool {
        switch type {
        case .local:
            return true
        case .remote:
            return query?.isEmpty != true
        }
    }

    func searchMovies(
            options: RequestOptions,
            request: MoviesRequest,
            type: LoadType = .remote) -> Single<[Movie]> {

        requester.request(options: options, singleRequest: {
            self.dm.moviesRepo.searchMovies(request: request, type: type)
                    .flatMap { movies in
                        switch type {
                        case .local:
                            return Single.just(movies)
                        case .remote:
                            if request.nextPage == 1 {
                                RealmManager().deleteAll()
                            }
                            return self.save(movies: movies).andThen(Single.just(movies))
                        }
                    }
        })
    }

    func save(movies: [Movie]) -> Completable {
        let options = RequestOptions.Builder()
                .showLoading(false)
                .build()
        return requester.request(options: options, completableRequest: {
            self.dm.moviesRepo.save(movies: movies)
        })
    }

}
