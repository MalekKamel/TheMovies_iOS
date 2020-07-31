//
// Created by mac on 2019-03-03.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(
                corners: UIRectCorner.all,
                radius: 20
        )
    }

}

@IBDesignable
class TopRoundView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(
                corners: UIRectCorner.top,
                radius: 20
        )
    }

}

@IBDesignable
class BottomRoundView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(
                corners: UIRectCorner.bottom,
                radius: 20
        )
    }

}

@IBDesignable
class TopRoundButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(
                corners: UIRectCorner.top,
                radius: 20
        )
    }

}

@IBDesignable
class BottomRoundButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(
                corners: UIRectCorner.bottom,
                radius: 20
        )
    }

}