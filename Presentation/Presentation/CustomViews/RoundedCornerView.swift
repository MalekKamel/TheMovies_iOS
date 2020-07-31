//
//  TopRoundedCorenerView.swift
//
//  Created by Shaban Kamel on 31/7/2020.
//  Copyright © 2019 Shaban Kamel. All rights reserved.
//

import UIKit
@IBDesignable

public class RoundedCornerView: UIView {

    var cornerRadiusValue : CGFloat = 40
    var corners : UIRectCorner = []
    
    @IBInspectable public var topLeft : Bool {
        get { corners.contains(.topLeft) }
        set { setCorner(newValue: newValue, for: .topLeft) }
    }
    
    @IBInspectable public var topRight : Bool {
        get { corners.contains(.topRight) }
        set { setCorner(newValue: newValue, for: .topRight) }
    }
    
    @IBInspectable public var bottomLeft : Bool {
        get { corners.contains(.bottomLeft) }
        set { setCorner(newValue: newValue, for: .bottomLeft) }
    }
    
    @IBInspectable public var bottomRight : Bool {
        get { corners.contains(.bottomRight) }
        set { setCorner(newValue: newValue, for: .bottomRight) }
    }
    
    func setCorner(newValue: Bool, for corner: UIRectCorner) {
        if newValue {
            addRectCorner(corner: corner)
        } else {
            removeRectCorner(corner: corner)
        }
    }
    
    func addRectCorner(corner: UIRectCorner) {
        corners.insert(corner)
        updateCorners()
    }
    
    func removeRectCorner(corner: UIRectCorner) {
        if corners.contains(corner) {
            corners.remove(corner)
            updateCorners()
        }
    }
    
    func updateCorners() {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadiusValue, height: cornerRadiusValue))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

