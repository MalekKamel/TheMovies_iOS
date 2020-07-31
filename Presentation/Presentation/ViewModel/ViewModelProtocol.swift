//
// Created by mac on 2019-03-25.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import Data
import RxSwift
import Moya
import RxRequester

public protocol ViewModelProtocol: Reportable, ActivityIndicatable, Alertable {
    var requester: AppRequester! { get set }
    var dm: DataManager { get set }
}

