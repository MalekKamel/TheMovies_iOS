//
// Created by Sha on 2019-03-02.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

public extension UITableView {

    func setup(
            source: UITableViewDataSource?,
            bundle: Bundle = Bundle.main,
            cellIdentifier: Identifier...
    ) {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 600
        dataSource = source
        cellIdentifier.forEach{ register($0, bundle: bundle) }

        separatorColor = UIColor.clear
        allowsSelection = false
        tableFooterView = UIView()
        tableHeaderView = nil

    }

    func setupProtoType(
            source: UITableViewDataSource?,
            bundle: Bundle = Bundle.main
    ) {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 600
        dataSource = source
        separatorColor = UIColor.clear
        allowsSelection = false
        tableFooterView = UIView()
        tableHeaderView = nil
    }

}
