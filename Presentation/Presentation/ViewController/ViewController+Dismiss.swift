//
// Created by Shaban Kamel on 06/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import UIKit

public extension UIViewController {

    func dismissSelf(animated: Bool = true) {
        dismiss(animated: animated)
        navigationController?.popViewController(animated: animated)
    }
}