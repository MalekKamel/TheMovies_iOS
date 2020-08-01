//
// Created by Shaban Kamel on 29/07/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public extension PrimitiveSequence where Trait == SingleTrait, Element == Response {

    func mapItem<T: Decodable>() -> Single<T> {
        map(T.self, failsOnEmptyData: false)
    }

    func mapList<T: Decodable>() -> Single<[T]> {
        map([T].self, failsOnEmptyData: false)
    }
}