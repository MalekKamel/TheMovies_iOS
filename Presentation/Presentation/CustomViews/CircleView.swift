//
//  CircleView.swift
//
//  Created by Shaban Kamel on 31/7/2020.
//  Copyright © 2019 Shaban Kamel. All rights reserved.
//

import UIKit

public class CircleView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
public override func draw(_ rect: CGRect) {
        // Drawing code
        //border radious
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
        
        //border
        self.layer.borderColor = #colorLiteral(red: 0, green: 0.651042521, blue: 0.5502350926, alpha: 1)
        self.layer.borderWidth = 0.5
        
        //drop shadow
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0.651042521, blue: 0.5502350926, alpha: 1)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 0.5
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    

}
