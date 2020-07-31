//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UINavigationBar {

    static func style() {
        let appearance = UINavigationBar.appearance()

        appearance.tintColor = Asset.Colors.white.color
        appearance.barTintColor = Asset.Colors.orange.color

        appearance.titleTextAttributes = [.foregroundColor: Asset.Colors.orange.color]

        if #available(iOS 11.0, *) {
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }

        let backgroundImage = UIImage(color: .hiHitchHikerBlack)?
                .resizableImage(withCapInsets: .zero, resizingMode: .stretch)
//
//        appearance.setBackgroundImage(backgroundImage, for: .default)
//        appearance.shadowImage = UIImage()
        appearance.isTranslucent = true

//        appearance.backIndicatorTransitionMaskImage = Asset.Assets.first.image
//                .stretchableImage(withLeftCapWidth: 24, topCapHeight: 24)

        //        appearance.backIndicatorImage = Asset.Assets.first.image
        //            .imageFlippedForRightToLeftLayoutDirection()
        //            .stretchableImage(withLeftCapWidth: 24, topCapHeight: 24)
    }

}
