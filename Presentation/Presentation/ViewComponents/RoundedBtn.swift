//
// Created by Sha on 2019-02-15.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class RoundedBtn: UIButton
{

    public override func layoutSubviews() {
        super.layoutSubviews()
        setTitleColor(.white, for: .normal)
        updateCornerRadius()
        frame.size.height = 40
    }

    @IBInspectable var rounded: Bool = true {
        didSet {
            updateCornerRadius()
        }
    }

    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
}

@IBDesignable class BlueRoundedBtn: RoundedBtn{
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = Asset.Colors.blue.color
    }
}

@IBDesignable class OrangeRoundedBtn: RoundedBtn{
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = Asset.Colors.orange.color
    }
}
