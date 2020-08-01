//
// Created by Apple on 01/08/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RealmSwift
import ModelsMapper

@objcMembers
public class MovieEntity: Object {
    public dynamic var popularity: Double = 0
    public dynamic var posterPath: String? = nil
    public dynamic var id: Int = 0
    public dynamic var title: String = ""
    public dynamic var overview: String = ""
    public dynamic var releaseDate: String? = nil

    public override static func primaryKey() -> String? { "id" }

}

class MovieEntityMapper: Mapper {
    typealias I = Movie
    typealias O = MovieEntity

    func map(_ input: Movie) -> MovieEntity {
        let out = MovieEntity()
        out.popularity = input.popularity
        out.posterPath = input.posterPath
        out.id = input.id
        out.title = input.title
        out.overview = input.overview
        out.releaseDate = input.releaseDate
        return out
    }
}

class MovieMapper: Mapper {
    typealias I = MovieEntity
    typealias O = Movie

    func map(_ input: MovieEntity) -> Movie {
        Movie(
                popularity: input.popularity,
                posterPath: input.posterPath,
                id: input.id,
                title: input.title,
                overview: input.overview,
                releaseDate: input.releaseDate
        )
    }
}