//Copyright HitchHiker© 2017. All rights reserved.

import UIKit

private enum AssociatedKeys {
    static var dropShadowValue = "dropShadowValue"
}

extension UIView {
    @IBInspectable var dropShadow: Bool {
        get { return dropShadowValue }
        set {
            if newValue {
                dropDefaultShadow()
            } else {
                layer.shadowColor = UIColor.clear.cgColor
            }
            dropShadowValue = newValue
        }
    }

    func dropDefaultShadow() {
        dropShadow(color: .black,
                   opacity: 0.25,
                   offSet: CGSize(width: 0, height: 1),
                   radius: 2)
    }

    func dropShadow(color: UIColor, opacity: Float, offSet: CGSize, radius: CGFloat) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }

    //Partially copy/pasted from https://github.com/jameslintaylor/AssociatedObjects/blob/master/AssociatedObjects/AssociatedObjects.swift
    fileprivate var dropShadowValue: Bool! {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.dropShadowValue) as? Bool ?? false }
        set { objc_setAssociatedObject(self, &AssociatedKeys.dropShadowValue, newValue,
                                       objc_AssociationPolicy(rawValue: 796)!) }
    }
}
