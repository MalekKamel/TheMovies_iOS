
import Foundation
import UIKit

extension Appearance {

    static let defaultAppearance: Appearance = {
        var value = Appearance()
        
        value.navigationBar.backgroundColor = UIColor.white
        value.navigationBar.barTintColor = UIColor.black
        value.navigationBar.tintColor = UIColor.black
        value.navigationBar.style = UIBarStyle.black
        value.statusBarStyle = .default

        return value
    }()
}
