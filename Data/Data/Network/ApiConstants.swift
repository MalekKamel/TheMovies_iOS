//
// Created by Shaban Kamel on 04/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import Core

class ApiConstants {
    static let BASE_URL = PListHelper.value(of: AppConfigName.baseUrl, bundle: Bundle(for: ApiConstants.self))!
    static let THE_MOVIE_DB_TOKEN = PListHelper.value(of: AppConfigName.movieDbToken, bundle: Bundle(for: ApiConstants.self))!
}