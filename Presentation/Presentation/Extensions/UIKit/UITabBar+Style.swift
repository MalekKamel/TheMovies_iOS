//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UITabBar {
    static func style() {
        let backgroundImage = UIImage(color: .hhGrayColor)?
            .resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        UITabBar.appearance().backgroundImage = backgroundImage
        UITabBar.appearance().tintColor = Asset.Colors.orange.color
        UITabBar.appearance().unselectedItemTintColor = Asset.Colors.blackDark.color
        UITabBar.appearance().isTranslucent = true
    }
}
