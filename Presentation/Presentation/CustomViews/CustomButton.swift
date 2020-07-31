//
//  CustomButton.swift
//
//  Created by Shaban Kamel on 31/7/2020.
//  Copyright © 2019 Shaban Kamel. All rights reserved.
//

import Foundation
import UIKit

public class CustomButton: UIButton {

    @IBInspectable var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            self.setTitleColor(UIColor.black,for: .normal)
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   public override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
        self.backgroundColor = #colorLiteral(red: 0, green: 0.651042521, blue: 0.5502350926, alpha: 1)
    }
}
