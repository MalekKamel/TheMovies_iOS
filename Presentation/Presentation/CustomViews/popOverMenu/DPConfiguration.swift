//
//  DPConfiguration.swift
//  DPArrowMenu
//
//  Created by Hongli Yu on 2018/12/28.
//  Copyright © 2018 Hongli Yu. All rights reserved.
//

import UIKit

enum DPArrowMenuDirection {
  case up
  case down
}

let DPDefaultMargin: CGFloat = 5
let DPDefaultCellMargin: CGFloat = 10
let DPDefaultMenuIconSize: CGFloat = 18
let DPDefaultMenuCornerRadius: CGFloat = 4
let DPDefaultMenuArrowWidth: CGFloat = 10
let DPDefaultMenuArrowHeight: CGFloat = 5
let DPDefaultAnimationDuration: TimeInterval = 0.2
let DPDefaultBorderWidth: CGFloat = 0.2
let DPDefaultCornerRadius: CGFloat = 10
let DPDefaultMenuRowHeight: CGFloat = 40
let DPDefaultMenuWidth: CGFloat = 250
let DPDefaultTintColor: UIColor = UIColor(red: 80 / 255.0, green: 80 / 255.0,
                                          blue: 80 / 255.0, alpha: 1)

public struct DPConfiguration {
  
  public var menuRowHeight: CGFloat = DPDefaultMenuRowHeight
  public var menuWidth: CGFloat = DPDefaultMenuWidth
  public var textColor: UIColor = UIColor.black
  public var textFont: UIFont = UIFont.systemFont(ofSize: 14)
  public var borderColor: UIColor = DPDefaultTintColor
  public var borderWidth: CGFloat = DPDefaultBorderWidth
  public var backgoundTintColor: UIColor = UIColor.white
  public var cornerRadius: CGFloat = DPDefaultCornerRadius
  public var textAlignment: NSTextAlignment = NSTextAlignment.left
  public var ignoreImageOriginalColor: Bool = false
  public var menuSeparatorColor: UIColor = UIColor.lightGray
  public var menuSeparatorInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: DPDefaultCellMargin,
                                                             bottom: 0, right: DPDefaultCellMargin)
  
}
