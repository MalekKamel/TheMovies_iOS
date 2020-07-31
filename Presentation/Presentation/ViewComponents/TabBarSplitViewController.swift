//
//  TabBarSplitViewController.swift
//  SchoolBus
//
//  Created by Sha on 1/15/19.
//  Copyright © 2019 A. All rights reserved.
//


import UIKit

public final class TabBarSplitViewController: UISplitViewController {
    var mainNavigationController: NavigationController?
    
    fileprivate var secondaryNavigationViewController: NavigationController?
    fileprivate weak var privateTabBarController: UITabBarController?
    public override var tabBarController: UITabBarController? {
         privateTabBarController
    }
    
    convenience init(mainNavigationController: NavigationController, _ tabBarController: UITabBarController?) {
        self.init(nibName: nil, bundle: nil)
        
        self.privateTabBarController = tabBarController
        
        viewControllers = [UIViewController(), UIViewController()]
        self.mainNavigationController = mainNavigationController
        
        tabBarItem = mainNavigationController.tabBarItem
        preferredDisplayMode = .allVisible
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        extendedLayoutIncludesOpaqueBars = true
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let mainNavigationController = mainNavigationController {
            viewControllers[0] = mainNavigationController
        }
    }
    
    public override func show(_ vc: UIViewController, sender: Any?) {
        guard let vc = vc as? NavigationController else {
            fatalError("Can only push navigation controllers here!")
        }
        viewControllers[0] = vc
        self.mainNavigationController = vc
    }
    
    public override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        guard let vc = vc as? NavigationController else {
            fatalError("Can only push navigation controllers here!")
        }
        viewControllers[1] = vc
    }
}

// MARK: - UISplitViewControllerDelegate
extension TabBarSplitViewController: UISplitViewControllerDelegate {
    public func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        primaryViewController.extendedLayoutIncludesOpaqueBars = true
        secondaryViewController.extendedLayoutIncludesOpaqueBars = true
        
        return (secondaryViewController as? UINavigationController)?.viewControllers.isEmpty != false
    }
    
    public func primaryViewController(forCollapsing splitViewController: UISplitViewController) -> UIViewController? {
        guard let mainNavigationViewController = splitViewController.viewControllers.first as? NavigationController,
            let detailsNavigationViewController = splitViewController.viewControllers[1] as? NavigationController else {
                return splitViewController.viewControllers.first
        }
        
        let allViewControllers = mainNavigationViewController.viewControllers + detailsNavigationViewController.viewControllers
        mainNavigationController = detailsNavigationViewController.copy(viewControllers: allViewControllers)
        return mainNavigationController
    }
    
    public func splitViewController(_ splitViewController: UISplitViewController,
                             separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {
         secondaryNavigationViewController
    }
    
    public func primaryViewController(forExpanding splitViewController: UISplitViewController) -> UIViewController? {
        guard let navigationViewController = splitViewController.viewControllers.first as? NavigationController,
            let firstViewController = navigationViewController.viewControllers.first else {
                return splitViewController.viewControllers.first
        }
        
        let viewControllers = Array(navigationViewController.viewControllers.dropFirst())
        if !viewControllers.isEmpty {
            secondaryNavigationViewController = navigationViewController.copy(viewControllers: viewControllers)
            secondaryNavigationViewController?.consistentLeftItem = displayModeButtonItem
        }
        
        navigationViewController.viewControllers = [firstViewController]
        return navigationViewController
    }
}
