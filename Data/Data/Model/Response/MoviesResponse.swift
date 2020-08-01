//
// Created by Apple on 29/07/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

// MARK: - MoviesResponse
public struct MoviesResponse: Codable {
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
}

// MARK: - Movie
public struct Movie: Codable {
    public let popularity: Double
    public let posterPath: String?
    public let id: Int
    public let title: String
    public let overview: String
    public let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case popularity = "popularity"
        case posterPath = "poster_path"
        case id = "id"
        case title = "title"
        case overview = "overview"
        case releaseDate = "release_date"
    }

    public func poster() -> String? {
        guard let posterPath = posterPath else {
            return nil
        }
        return "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
}