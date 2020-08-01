//
// Created by Shaban Kamel on 03/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxSwift

public class MoviesRepo {
    let remoteSrc: MoviesRemoteDataSrc
    let localSrc: MoviesLocalDataSrc

    static func create() -> MoviesRepo {
        MoviesRepo(
                remoteSrc: MoviesRemoteDataSrc(api: moviesApi),
                localSrc: MoviesLocalDataSrc(db: MovieDao())
        )
    }

    init(remoteSrc: MoviesRemoteDataSrc, localSrc: MoviesLocalDataSrc) {
        self.remoteSrc = remoteSrc
        self.localSrc = localSrc
    }

    public func discoverMovies(request: MoviesRequest) -> Single<[Movie]> {
        remoteSrc.discoverMovies(request: request)
                .map { response in
                    response.results
                }
    }

    public func searchMovies(request: MoviesRequest, type: LoadType = .remote) -> Single<[Movie]> {
        switch type {
        case .local:
            return localSrc.all()
        case .remote:
            return remoteSrc.searchMovies(request: request)
                    .map { response in
                        response.results
                    }
        }
    }

    public func save(movies: [Movie]) -> Completable {
        localSrc.save(movies: movies)
    }

}