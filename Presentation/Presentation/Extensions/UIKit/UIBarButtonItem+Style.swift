//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UIBarButtonItem {
    static func style() {
        [.normal, .selected, .disabled].forEach {
            appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: $0)
        }

        [.normal, .selected, .disabled].forEach {
            appearance(whenContainedInInstancesOf: [UIToolbar.self])
                .setTitleTextAttributes([.foregroundColor: UIColor.hiHitchHikerYellow], for: $0)
        }
    }
}
