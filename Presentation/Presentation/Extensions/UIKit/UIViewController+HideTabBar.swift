//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UIViewController {
    func setTabBarHidden(_ hidden: Bool) {
        guard let frame = self.tabBarController?.tabBar.frame,
            hidden != self.tabBarController?.tabBar.isHidden else { return }

        if #available(iOS 11.0, *) {
            additionalSafeAreaInsets.bottom = hidden ? -frame.height : 0
        }

        let factor: CGFloat = hidden ? 1 : -1
        let yOrigin = frame.origin.y + (frame.size.height * factor)
        UIView.animate(withDuration: 0.3) {
            self.tabBarController?.tabBar.frame = CGRect(x: frame.origin.x, y: yOrigin,
                                                         width: frame.width,
                                                         height: frame.height)
            self.tabBarController?.tabBar.isHidden = hidden
        }
    }
}
