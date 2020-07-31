//
//  SplashVC.swift
//  App
//
//  Created by Shaban Kamel on 04/02/2020.
//  Copyright © 2020 sha. All rights reserved.
//

import UIKit
import Core
import SnapKit

public class ListVC: UIViewController {
    public var items: [String] = []
    var tableView: UITableView = UITableView()
    public var onItemSelected: ((String, Int) -> Void)!
    var listTitle: String? = nil

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.contentInsetAdjustmentBehavior = .never
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }

        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListCell.self, forCellReuseIdentifier: Identifier.cell.rawValue)
    }

}

extension ListVC: ListCellDelegate {
    func itemSelected(item: String, index: Int) {
        onItemSelected(item, index)
        dismissSelf()
    }
}

// MARK: TableView
extension ListVC: UITableViewDataSource, UITableViewDelegate  {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cell.rawValue, for: indexPath) as! ListCell
        cell.delegate = self
        cell.setup(item: items[indexPath.row], index: indexPath.row)
        return cell
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { listTitle }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 50 }
}

protocol ListCellDelegate {
    func itemSelected(item: String, index: Int)
}

class ListCell: UITableViewCell {
    var item: String!
    var index: Int = 0
    var delegate: ListCellDelegate!

    func setup(item: String, index: Int) {
        self.item = item
        self.index = index
        textLabel?.text = item
        contentView.tap(target: self, action: #selector(cellClicked))
    }

    @objc func cellClicked() {
        delegate.itemSelected(item: item, index: index)
    }
}