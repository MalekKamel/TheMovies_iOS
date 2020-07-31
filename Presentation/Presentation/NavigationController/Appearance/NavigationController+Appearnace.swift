//
// Created by mac on 2019-03-18.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit

// MARK: appearance implementation
extension NavigationController : NavControllerContext {

    func applyAppearance(
            for viewController: UIViewController,
            animated: Bool
    ) {
        let context = viewController as? NavControllerContext ?? self

        applyAppearance(
                for: context,
                viewController: viewController,
                animated: animated
        )

        interactiveGestureAppearance(for: viewController, animated: animated)
    }

    private func interactiveGestureAppearance(
            for viewController: UIViewController,
            animated: Bool
    ) {
        // interactive gesture requires more complex logic.
        guard let coordinator = viewController.transitionCoordinator, coordinator.isInteractive else {
            return
        }

        coordinator.animate(
                alongsideTransition: { _ in },
                completion: { context in
                    if context.isCancelled, let appearanceContext =
                    self.topViewController as? NavControllerContext {
                        // hiding navigation bar & toolbar within interaction completion will result into inconsistent UI state
                        self.setNavigationBarHidden(
                                appearanceContext.prefersNavBarHidden(navController: self),
                                animated: animated
                        )
                        self.setToolbarHidden(
                                appearanceContext.prefersNavToolbarHidden(navController: self),
                                animated: animated
                        )
                    }
                }
        )

        coordinator.notifyWhenInteractionChanges { context in
            let key = UITransitionContextViewControllerKey.from
            if context.isCancelled, let from =
            context.viewController(forKey: key) as? NavControllerContext {
                // changing navigation bar & toolbar appearance within animate completion will result into UI glitch
                self.apply(
                        appearance: from.preferredNavBarAppearance(navController: self),
                        animated: true
                )
            }
        }
    }

    public func applyAppearance(
            for context: NavControllerContext,
            viewController: UIViewController,
            animated: Bool
    ) {
        self.navigationController?.navigationBar.titleTextAttributes =
                [NSAttributedString.Key.font: UIFont.defaultFont11]

        setNavigationBarHidden(
                context.prefersNavBarHidden(navController: self),
                animated: true
        )
        setToolbarHidden(
                context.prefersNavToolbarHidden(navController: self),
                animated: true
        )
        apply(
                appearance: context.preferredNavBarAppearance(navController: self),
                animated: true
        )

        setBackButtonMode(for: context, viewController: viewController)

    }

    private func setBackButtonMode(for context: NavControllerContext, viewController: UIViewController) {
        switch context.preferredBackButtonMode(navController: self) {
        case .none:
            return

        case .visible:
            switch context.preferredBackButtonPosition(navController: self) {
            case .left:
                // it's left by default
                return
            case .right:
                return
            }
        case .invisible:
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())

        case .withoutText:
            let back = UIBarButtonItem(
                    title: "",
                    style: .plain,
                    target: self,
                    action:  #selector(backAction)
            )
            back.image = Asset.Assets.icBack.image
            setBackButtonItem(
                    item: back,
                    context: context,
                    viewController: viewController
            )

        }
    }

    private func setBackButtonItem(
            item: UIBarButtonItem,
            context: NavControllerContext,
            viewController: UIViewController
    ) {
        switch context.preferredBackButtonPosition(navController: self) {
        case .left:
            viewController.navigationItem.leftBarButtonItem = item
        case .right:
            viewController.navigationItem.rightBarButtonItem = item
        }
    }

    @objc
    func backAction() {
        popViewController(animated: true)
    }

    func apply(appearance: Appearance?, animated: Bool) {
        guard appearance != nil else { return }

        appliedAppearance = appearance

        appearanceApplyingStrategy.apply(
                appearance: appearance,
                to: self,
                animated: animated
        )
        setNeedsStatusBarAppearanceUpdate()
    }

    func updateAppearance(for viewController: UIViewController) {
        guard let context = viewController as? NavControllerContext,
              viewController == topViewController && transitionCoordinator == nil
                else { return }

        applyAppearance(for: context, animated: true)
    }

    public func updateAppearance() {
        guard let top = topViewController else { return }
        updateAppearance(for: top)
    }

    public override var preferredStatusBarStyle: UIStatusBarStyle {
         appliedAppearance?.statusBarStyle ?? super.preferredStatusBarStyle
    }

    public override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
         appliedAppearance != nil ? .fade : super.preferredStatusBarUpdateAnimation
    }
}
