//
// Created by mac on 9/28/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import UIKit

public protocol PaginatedTableViewDataSource: class {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func numberOfSections(in tableView: UITableView) -> Int
}

@objc public protocol PaginatedTableViewDelegate: class {

    @objc optional func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    @objc optional func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat

    @objc optional func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    @objc optional func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    @objc optional func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath)
    @objc optional func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    @objc optional func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    @objc optional func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?

    func loadMore(start: Int, pageCount: Int, onSuccess: ((Int) -> Void)?, onError: ((Error) -> Void)?)
}

public class PagedTableView: UITableView {

    weak open var paginatedDelegate: PaginatedTableViewDelegate?
    weak open var paginatedDataSource: PaginatedTableViewDataSource?

    var loadedCount: Int = 0
    var pageCount: Int = 30
    var isLoading = false
    var hasMoreItems = true

    //initWithFrame to init view from code
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }

    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        self.delegate = self
        self.dataSource = self
//        self.alwaysBounceVertical = true
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 600
    }
}

// MARK: helpers
extension PagedTableView {

    public func loadItems(refresh: Bool = false) {

        // reset page number if refresh
        if refresh {
            loadedCount = 0
            hasMoreItems = true
        }

        // return if already loading or dont have any more data
        guard hasMoreItems, !isLoading else { return }

        // start loading
        isLoading = true

        addLoadingFooter()

        paginatedDelegate?.loadMore(
                start: loadedCount,
                pageCount: pageCount,
                onSuccess: { count in
                    if count < self.pageCount {
                        self.hasMoreItems = false
                        self.tableFooterView = nil
                    }
                    self.isLoading = false
                    self.loadedCount += count
                    self.reloadData()
                },
                onError: { _ in
                    self.isLoading = false
                    self.tableFooterView = nil
                })
    }

    private func addLoadingFooter() {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(
                x: CGFloat(0),
                y: CGFloat(0),
                width: bounds.width,
                height: CGFloat(44)
        )

        tableFooterView = spinner
        tableFooterView?.isHidden = false
    }
}


extension PagedTableView: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let number = paginatedDataSource?.tableView(tableView, numberOfRowsInSection: section)
        if number == nil { return 0 }
        return  hasMoreItems ? number! + 1 : number!
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if hasMoreItems && indexPath.row == loadedCount {
            loadItems()
            return UITableViewCell()
        }
        return paginatedDataSource?.tableView(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }

    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return paginatedDelegate?.tableView?(tableView, estimatedHeightForRowAt: indexPath) ?? estimatedRowHeight
    }

    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        paginatedDelegate?.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
    }

    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        paginatedDelegate?.tableView?(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return paginatedDataSource?.numberOfSections(in: tableView) ?? 0
    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return paginatedDelegate?.tableView?(tableView, viewForHeaderInSection: section)
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        paginatedDelegate?.tableView?(tableView, didSelectRowAt: indexPath)
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return paginatedDelegate?.tableView?(tableView, titleForHeaderInSection: section)
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return paginatedDelegate?.tableView?(tableView, heightForHeaderInSection: section) ?? CGFloat(0)
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return paginatedDelegate?.tableView?(tableView, heightForRowAt: indexPath) ?? rowHeight
    }
}



