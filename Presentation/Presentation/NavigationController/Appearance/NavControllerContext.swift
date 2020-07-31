
import Foundation
import UIKit

public protocol NavControllerContext: AnyObject where Self:  UIViewController {

    func prefersNavBarHidden(navController: UINavigationController) -> Bool
    func prefersNavToolbarHidden(navController: UINavigationController) -> Bool
    func preferredNavBarAppearance(navController: UINavigationController) -> Appearance?
    func preferredBackButtonMode(navController: UINavigationController) -> BackButtonMode
    func preferredBackButtonPosition(navController: UINavigationController) -> BackButtonPosition
    func setNeedsUpdateNavBarAppearance()
}

extension NavControllerContext {

    public func prefersNavBarHidden(navController: UINavigationController) -> Bool {
         true
    }

    public func prefersNavToolbarHidden(navController: UINavigationController) -> Bool {
         true
    }

    public func preferredNavBarAppearance(navController: UINavigationController) -> Appearance? {
         Appearance.defaultAppearance
    }

    public func setNeedsUpdateNavBarAppearance() {
        guard let navigationController = self.navigationController as? NavigationController
                else { return }

        navigationController.updateAppearance(for: self)
    }

    public func preferredBackButtonMode(navController: UINavigationController) -> BackButtonMode {
         .withoutText
    }

    public func preferredBackButtonPosition(navController: UINavigationController) -> BackButtonPosition {
         .left
    }
}

public enum BackButtonMode {
    case none
    case visible
    case invisible
    case withoutText
}

public enum BackButtonPosition{
    case left
    case right
}
