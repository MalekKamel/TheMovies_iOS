//
// Created by Sha on 2019-03-02.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

public extension UICollectionView {

    func setup(
            source: UICollectionViewDataSource?,
            bundle: Bundle = Bundle.main,
            cellIdentifier: Identifier...
    ) {
        dataSource = source
        cellIdentifier.forEach{ register($0, bundle: bundle) }
        allowsSelection = false
    }

    func setupProtoType(
            source: UICollectionViewDataSource?,
            bundle: Bundle = Bundle.main
    ) {
        dataSource = source
        allowsSelection = false
    }

}
