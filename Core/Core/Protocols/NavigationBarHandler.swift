//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

protocol NavigationBarHandler {
    func hideNavigationBar()
    func showNavigationBar()
    func showBackButton()
}

private var popGesture: InteractivePopRecognizer?
extension NavigationBarHandler where Self: UIViewController {

    func hideNavigationBar() {
//        if let navigationController = navigationController {
//            popGesture = InteractivePopRecognizer(controller: navigationController)
//            navigationController.setNavigationBarHidden(true, animated: false)
//            navigationController.interactivePopGestureRecognizer?.delegate = popGesture
//        }
//        UIApplication.shared.statusBarStyle = .default
    }

    func showNavigationBar() {
//        navigationController?.setNavigationBarHidden(false, animated: false)
//        UIApplication.shared.statusBarStyle = .lightContent
    }

    func showBackButton() {
//        let backItem = UIBarButtonItem()
//        backItem.title = "BACK"
//        navigationItem.backBarButtonItem = backItem //
    }
}
