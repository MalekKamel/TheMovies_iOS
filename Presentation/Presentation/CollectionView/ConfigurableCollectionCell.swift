//
// Created by mac on 2019-05-31.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

public protocol ConfigurableCollectionCellDelegate{
    func cellCollectionView(cell: UICollectionViewCell) -> UICollectionView
    func viewController() -> UIViewController
}

public protocol ConfigurableCollection where Self: UICollectionViewCell {
    func configure(item: Any)
}

open class ConfigurableCollectionCell<ITEM>: UICollectionViewCell, ConfigurableCollection {
    public var item: ITEM!

    public func configure(item: Any){
        self.item = item as! ITEM
        setup()
    }

    // Designed to be overridden
    open func setup(){}
}