//
// Created by mac on 2019-05-31.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import BLTNBoard

typealias ConfirmHandler = ((BLTNActionItem) -> Void)
typealias CancelHandler = ((BLTNActionItem) -> Void)?

class ConfirmBulletin: NSObject {
    var presentingVC: UIViewController!

    var confirmHandler: ConfirmHandler
    var cancelHandler: CancelHandler
    var message: String
    var actionButtonTitle: String
    var alternativeButtonTitle: String

    lazy var bulletinManager: BLTNItemManager = { BLTNItemManager(rootItem: createPage()) }()

    init(
            vc: UIViewController,
            message: String,
            actionButtonTitle: String = L10n.proceed,
            alternativeButtonTitle: String = L10n.cancel,
            confirmHandler: @escaping ConfirmHandler,
            cancelHandler: CancelHandler = nil
    ) {
        self.message = message
        self.actionButtonTitle = actionButtonTitle
        self.alternativeButtonTitle = alternativeButtonTitle
        self.confirmHandler = confirmHandler
        self.cancelHandler = cancelHandler
        self.presentingVC = vc
    }

    func show() {
        retainMe()
        bulletinManager.showBulletin(above: presentingVC)
    }

    func createPage() -> BLTNPageItem {
        let page = BLTNPageItem(title: L10n.confirmation)

        page.isDismissable = true
        page.descriptionText = message
        page.actionButtonTitle = actionButtonTitle
        page.alternativeButtonTitle = alternativeButtonTitle
        page.actionHandler = { [weak self] item in
            self?.bulletinManager.dismissBulletin()
            self?.confirmHandler(item)
        }
        page.alternativeHandler = { [weak self] item in
            self?.bulletinManager.dismissBulletin()
            self?.cancelHandler?(item)
        }
        page.dismissalHandler = { [weak self] item in
            self?.releaseMe()
        }
        return page
    }
}
