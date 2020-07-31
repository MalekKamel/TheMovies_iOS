//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

extension UIView {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.3
        pulse.fromValue = 1.0
        pulse.toValue = 0.95
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 1.0
        pulse.damping = 1.0
        layer.add(pulse, forKey: "pulse")

        alpha = 0.5
        UIView.animate(withDuration: 0.8) { self.alpha = 1 }
    }
}
