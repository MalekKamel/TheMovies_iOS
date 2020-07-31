//
// Created by mac on 11/15/19.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

public class FloatingLabel: UILabel {

    public override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        super.drawText(in: rect.inset(by: insets))
    }

}