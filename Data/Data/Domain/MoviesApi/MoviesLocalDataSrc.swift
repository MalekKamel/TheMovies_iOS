//
// Created by Apple on 01/08/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxSwift
import ModelsMapper

class MoviesLocalDataSrc {

    private let db: MovieDao

    init(db: MovieDao) {
        self.db = db
    }

    public func all() -> Single<[Movie]> {
        db.all().map { entities in
            entities.map { entity in
                MovieMapper().map(entity)
            }
        }
    }

    public func save(movies: [Movie]) -> Completable {
        let entities = ListMapper(MovieEntityMapper()).map(movies)
        return db.add(movies: entities)
    }
}