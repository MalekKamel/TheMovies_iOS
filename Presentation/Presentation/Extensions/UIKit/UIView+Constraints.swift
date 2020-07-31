//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UIView {
    /// Adds constraints to this `UIView` instances `superview` object to make sure this always has the same size as the superview.
    /// Please note that this has no effect if its `superview` is `nil` – add this `UIView` instance as a subview before calling this.
    func bindFrameToSuperviewBounds(insets: UIEdgeInsets = UIEdgeInsets.zero) {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false

        superview.widthAnchor.constraint(equalTo: widthAnchor, constant: insets.left + insets.right).isActive = true
        superview.heightAnchor.constraint(equalTo: heightAnchor, constant: insets.top + insets.bottom).isActive = true
        superview.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        superview.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
