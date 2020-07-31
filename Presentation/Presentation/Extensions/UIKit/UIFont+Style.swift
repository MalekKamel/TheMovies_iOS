//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UIFont {
    static let tabBarFont = UIFont.systemFont(ofSize: 11.0, weight: .semibold)

    static let defaultFont8 = UIFont.systemFont(ofSize: 8)
    static let defaultFont11 = UIFont.systemFont(ofSize: 11)
    static let defaultFont14 = UIFont.systemFont(ofSize: 14)
    static let defaultFont17 = UIFont.systemFont(ofSize: 17)
    static let defaultFont20 = UIFont.systemFont(ofSize: 20)
    static let defaultFont25 = UIFont.systemFont(ofSize: 25)
    static let defaultFont33 = UIFont.systemFont(ofSize: 33)

    static let defaultFontMedium12 = UIFont.systemFont(ofSize: 12, weight: .medium)
    static let defaultFontMedium14 = UIFont.systemFont(ofSize: 14, weight: .medium)

    static let defaultFontSemi14 = UIFont.systemFont(ofSize: 14, weight: .semibold)

    static let defaultFontHeavy10 = UIFont.systemFont(ofSize: 10, weight: .heavy)

    static let defaultFontBold12 = UIFont.boldSystemFont(ofSize: 12)
    static let defaultFontBold14 = UIFont.boldSystemFont(ofSize: 14)
    static let defaultFontBold20 = UIFont.boldSystemFont(ofSize: 20)
    static let defaultFontBold25 = UIFont.boldSystemFont(ofSize: 25)
}

// Text styles
extension UIFont {

    @nonobjc class var hiAccountCreationButton: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .medium)
    }

    @nonobjc class var hiLoginHint: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .medium)
    }

    @nonobjc class var hiForgotPassword: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .medium)
    }

    @nonobjc class var hiLoginInputField: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .medium)
    }

    @nonobjc class var hiPolicyLink: UIFont {
        return UIFont.systemFont(ofSize: 11.0, weight: .medium)
    }

    @nonobjc class var hiPolicyLabel: UIFont {
        return UIFont.systemFont(ofSize: 11.0, weight: .regular)
    }
}
