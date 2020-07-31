//
// Created by Shaban Kamel on 04/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxRequester
import Data

class TabBarVCBuilder {
    static func make() -> TabBarVC {
        let vc = StoryboardScene.TabBar.initialScene.instantiate()
        vc.viewControllers = [
            DiscoverMoviesVCBuilder.make(),
            SearchMoviesVCBuilder.make()
        ]
        let vm = TabBarViewModel(rxRequester: AppRequester(presentable: vc), dm: DataManager.create())
        vc.vm = vm
        return vc
    }
}
