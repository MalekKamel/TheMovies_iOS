//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UIView {
    @discardableResult
    func sizeViewToFit() -> UIView {
        let view = self
        view.setNeedsLayout()
        view.layoutIfNeeded()

        let height = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var frame = view.frame
        frame.size.height = height
        view.frame = frame

        return view
    }
}
