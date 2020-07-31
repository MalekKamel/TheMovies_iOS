//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UIColor {
    static let sbMainColor = color(0x6EA1F8)
    static let sbBlue = color(0x0284f3)
    static let sbOrange = color(0xfb6f4b)
    static let hhBlackColor = UIColor.hiHitchHikerBlack
    static let hhLightBlackColor = UIColor.hhBlackColor.withAlphaComponent(0.91)
    static let hhShadowColor = color(0x000028)
    static let hhGrayColor = color(0xFAFAFA)
    static let hhOrangeColor = color(0xfcbf10)
    static let hhScrollViewsBackgroundColor = color(0xF6F5F1)
    static let hhMessageCellColor = color(0xfcbf10)
    static let hhFormFieldBackground = color(0xf6f5f1)
    static let hhFormFieldSeparator = color(0xe6e6e6)
    static let hhRatingStarEmptyColor = color(0xb3b3b3)
    static let hhIconColor = color(0x6d6e70)
    static let hhIndicatorUnselected = color(0xeaeaea)

    fileprivate static func color(_ netHex: Int, alpha: CGFloat = 1.0) -> UIColor {
        return createColor(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff, alpha: alpha)
    }

    fileprivate static func createColor(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) -> UIColor {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255

        return UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
    }
}

// Color palette

extension UIColor {

    class var hiHitchHikerYellow: UIColor {
        return UIColor(red: 252.0 / 255.0, green: 191.0 / 255.0, blue: 16.0 / 255.0, alpha: 1.0)
    }

    class var hiHitchHikerBlack: UIColor {
        return UIColor(red: 84.0 / 255.0, green: 85.0 / 255.0, blue: 84.0 / 255.0, alpha: 1.0)
    }

    class var hiFacebook: UIColor {
        return UIColor(red: 66.0 / 255.0, green: 103.0 / 255.0, blue: 178.0 / 255.0, alpha: 1.0)
    }

    class var hiGoogle: UIColor {
        return UIColor(red: 66.0 / 255.0, green: 133.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
    }

    class var hiWhite: UIColor {
        return UIColor(white: 255.0 / 255.0, alpha: 1.0)
    }

    class var hiLightGrey: UIColor {
        return UIColor(red: 246.0 / 255.0, green: 245.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
    }

    class var hiIcon: UIColor {
        return UIColor(red: 109.0 / 255.0, green: 110.0 / 255.0, blue: 112.0 / 255.0, alpha: 1.0)
    }

    class var hiHint: UIColor {
        return UIColor(white: 191.0 / 255.0, alpha: 1.0)
    }

    class var hiWhiteTwo: UIColor {
        return UIColor(white: 245.0 / 255.0, alpha: 1.0)
    }
}
