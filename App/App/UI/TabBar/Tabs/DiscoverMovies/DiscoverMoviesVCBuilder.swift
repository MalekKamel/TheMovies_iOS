//
// Created by Shaban Kamel on 04/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxRequester
import Data
import Core

class DiscoverMoviesVCBuilder {
    static func make() -> DiscoverMoviesVC {
        let vc = StoryboardScene.DiscoverMovies.initialScene.instantiate()
        vc.tabBarItem = UITabBarItem(
                title: L10n.discover,
                image: Asset.Assets.icNotification.image,
                selectedImage: Asset.Assets.icNotificationActive.image
        )
        let vm = DiscoverMoviesVM(rxRequester: AppRequester(presentable: vc), dm: DataManager.create())
        vc.vm = vm
        return vc
    }
}
