//
// Created by Shaban Kamel on 04/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxRequester
import Data
import Core

class SearchMoviesVCBuilder {
    static func make() -> SearchMoviesVC {
        let vc = StoryboardScene.SearchMovies.initialScene.instantiate()
        vc.tabBarItem = UITabBarItem(
                title: L10n.search,
                image: Asset.Assets.icSearch.image,
                selectedImage: Asset.Assets.icSearch.image
        )
        let vm = SearchMoviesVM(rxRequester: AppRequester(presentable: vc), dm: DataManager.create())
        vc.vm = vm
        return vc
    }
}
