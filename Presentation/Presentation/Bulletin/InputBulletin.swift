//
// Created by mac on 2019-05-26.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import BLTNBoard

class InputBulletin {

    var presentingVC: UIViewController!
    var title: String
    var descriptionText: String = ""
    var placeholder: String = ""
    var actionButtonTitle: String
    var isDismissable: Bool = true
    var textInputHandler: ((BLTNActionItem, String?) -> Void)? = nil
    var actionHandler: ((BLTNActionItem, String?) -> Void)

    lazy var bulletinManager: BLTNItemManager = {
        return BLTNItemManager(rootItem: makeTextFieldPage())
    }()

    init(
            presentingVC vc: UIViewController,
            title: String,
            descriptionText: String = "",
            placeholder: String,
            actionButtonTitle: String,
            isDismissable: Bool = true,
            textInputHandler: ((BLTNActionItem, String?) -> Void)? = nil,
            actionHandler: @escaping ((BLTNActionItem, String?) -> Void)
    ) {
        self.presentingVC = vc
        self.title = title
        self.descriptionText = descriptionText
        self.placeholder = placeholder
        self.actionButtonTitle = actionButtonTitle
        self.isDismissable = isDismissable
        self.textInputHandler = textInputHandler
        self.actionHandler = actionHandler
    }

    func show(
    ) {
        bulletinManager.showBulletin(above: presentingVC)
    }

    func makeTextFieldPage() -> FeedbackBulletin {

        let page = FeedbackBulletin(title: title)
        page.descriptionText = descriptionText
        page.placeholder = placeholder
        page.actionButtonTitle = actionButtonTitle
        page.isDismissable = true
        page.actionHandler = { item in
            self.actionHandler(item, page.textField.text)
        }

        page.textInputHandler = { (item, text) in
            item.manager?.dismissBulletin(animated: true)
        }

        return page

    }
}
