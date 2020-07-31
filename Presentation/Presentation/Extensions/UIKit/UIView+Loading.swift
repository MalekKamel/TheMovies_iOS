//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

private let indicatorTag = 23482398
extension UIView {
    func showLoading(_ show: Bool) {
        if show {
            if let indicator = viewWithTag(indicatorTag) as? UIActivityIndicatorView {
                indicator.startAnimating()
                indicator.isHidden = false
                return
            }
            let indicator = UIActivityIndicatorView()
            indicator.tag = indicatorTag
            addSubview(indicator)
            indicator.bindFrameToSuperviewBounds()
            indicator.startAnimating()
            return
        }
        let indicator = viewWithTag(indicatorTag) as? UIActivityIndicatorView
        indicator?.stopAnimating()
        indicator?.isHidden = true
    }
}
