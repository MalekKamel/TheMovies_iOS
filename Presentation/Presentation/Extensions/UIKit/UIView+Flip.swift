//
// Created by Shaban Kamel on 05/03/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import UIKit

public extension UIView {

    func showFlip() {
        if !self.isHidden { return }
        self.isHidden = false
        UIView.transition(with: self, duration: 1, options: [.transitionFlipFromRight,.allowUserInteraction], animations: nil)
    }

    func hideFlip() {
        if self.isHidden { return }

        UIView.transition(with: self, duration: 1, options: [.transitionFlipFromRight,.allowUserInteraction], animations: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { self.isHidden = true }
    }
}
