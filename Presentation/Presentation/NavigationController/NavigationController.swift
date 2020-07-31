//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

public class NavigationController: UINavigationController {
    public var lastViewController: UIViewController? = nil

    public override var childForStatusBarStyle: UIViewController? { viewControllers.last }
    public override var tabBarController: UITabBarController? { parent?.tabBarController }
    var appliedAppearance: Appearance?

    // MARK: initializers
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        delegate = self
    }

    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        delegate = self
    }

    override public init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        delegate = self
    }

    var appearanceApplyingStrategy = AppearanceApplyingStrategy() {
        didSet {
            apply(appearance: appliedAppearance, animated: false)
        }
    }

    public convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    var consistentLeftItem: UIBarButtonItem? {
        didSet {
            navigationItem.leftBarButtonItem = consistentLeftItem
            navigationItem.leftItemsSupplementBackButton = true
        }
    }

}
