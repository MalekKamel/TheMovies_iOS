//
// Created by Sha on 2019-03-02.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

public extension UICollectionView {

    func register(_ identifier: Identifier, bundle: Bundle) {
        self.register(identifier.nib(bundle: bundle), forCellWithReuseIdentifier: identifier.rawValue)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(
            withIdentifier identifier: Identifier,
            for indexPath: IndexPath
    ) -> T {
        let cell = self.dequeueReusableCell(
                withReuseIdentifier: identifier.rawValue,
                for: indexPath
        ) as! T
        cell.layoutIfNeeded()
        return cell
    }

    func configureCell<CELL: ConfigurableCollection>(
            identifier: Identifier,
            indexPath: IndexPath,
            item: Any
    ) -> CELL {
        let cell: CELL = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.configure(item: item)
        return cell
    }
}
