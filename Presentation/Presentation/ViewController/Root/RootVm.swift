//Copyright Hitchhiker© 2017. All rights reserved.

import Foundation
import RxRequester
import Data

public final class RootVm: ViewModelProtocol {
    public var requester: AppRequester!
    public var dm: DataManager

    public init(rxRequester: AppRequester, dm: DataManager) {
        self.requester = rxRequester
        self.dm = dm
    }

}
