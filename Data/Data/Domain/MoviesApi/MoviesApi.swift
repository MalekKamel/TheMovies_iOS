//
// Created by Shaban Kamel on 02/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import Moya

let authApi: MoyaProvider<MoviesApi> = createProvider()

enum MoviesApi {
    case discoverMovies(MoviesRequest)
    case searchMovies(MoviesRequest)
}

extension MoviesApi: TargetType {
    public var baseURL: URL {
        URL(string: ApiConstants.BASE_URL)!
    }

    public var path: String {
        switch self {
        case .discoverMovies:
            return "/discover/movie"
        case .searchMovies:
            return "/search/movie"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .discoverMovies,
             .searchMovies:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case let .discoverMovies(request):
            let params: [String: Any] = ["page": request.nextPage]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)

        case let .searchMovies(request):
            let params: [String: Any] = ["page": request.nextPage, "query": request.search]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }

    public var validationType: ValidationType {
        .none
    }
    public var sampleData: Data {
        Data()
    }
    public var headers: [String: String]? {
        ["Authorization": "Bearer \(ApiConstants.THE_MOVIE_DB_TOKEN)"]
    }
    var parameters: [String: Any]? {
        nil
    }
}

