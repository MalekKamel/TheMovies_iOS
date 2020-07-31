//
// Created by mac on 2019-08-13.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

class RoundStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyBackground()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyBackground()
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        applyBackground()
    }

    private func applyBackground() {
        addBackground(
                color: .white,
                cornerRadius: 15,
                padding: 20
        )
    }
}