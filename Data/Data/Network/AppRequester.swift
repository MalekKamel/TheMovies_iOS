//
// Created by Shaban Kamel on 04/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxRequester
import RxSwift

public class AppRequester {
    private let requester: RxRequester

    public init(presentable: Presentable) {
        requester = RxRequester(presentable: presentable)
    }

    public func request<T>(
            options: RequestOptions = RequestOptions.defaultOptions(),
            singleRequest: @escaping SingleRequest<T>) -> Single<T> {
        requester.request(options: options, singleRequest: singleRequest)
    }


}
