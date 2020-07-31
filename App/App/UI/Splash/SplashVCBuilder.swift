//
// Created by Shaban Kamel on 04/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxRequester
import Data

class SplashVCBuilder {
    static func make() -> SplashVC {
        let vc = StoryboardScene.Splash.initialScene.instantiate()
        let vm = SplashVM(rxRequester: AppRequester(presentable: vc), dm: DataManager.create())
        vc.vm = vm
        return vc
    }
}
