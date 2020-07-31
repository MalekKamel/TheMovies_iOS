//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UIView {
    func copy<T: UIView>() -> T {
        //swiftlint:disable force_cast
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
        //swiftlint:enable force_cast
    }
}
