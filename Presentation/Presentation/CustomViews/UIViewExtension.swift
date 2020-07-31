//
//  UIViewExtension.swift
//
//  Created by Shaban Kamel on 31/7/2020.
//  Copyright © 2019 Shaban Kamel. All rights reserved.
//

import UIKit
public extension UIView{
    func animShow(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear],
                       animations: {
//                        self.center.y -= self.bounds.height
                        self.frame.size.height = 170
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
        
    }
    func animHide(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear],
                       animations: {
//                        self.center.y += self.bounds.height
                        self.frame.size.height = 0
                        self.layoutIfNeeded()
        },  completion: {(_ completed: Bool) -> Void in
        self.isHidden = true
            })
    }
}
