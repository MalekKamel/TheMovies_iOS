//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UITabBarItem {
    static func style() {
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.tabBarFont], for: .normal)
    }
}
