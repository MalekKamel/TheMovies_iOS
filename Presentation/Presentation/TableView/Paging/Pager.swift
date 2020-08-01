//
// Created by Shaban Kamel on 01/08/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

public class Pager {
    weak var tableView: PagedTableView!
    var loadMore: ((_ next: Int) -> Void)!
    var pageKeyType: PageKeyType = .paged

    public class Builder {
        private let pager: Pager = Pager()

        public init() {}

        public func loadMore(_ block: @escaping (_ next: Int) -> Void) -> Builder {
            pager.loadMore = block
            return self
        }

        public func pageKeyType(type: PageKeyType) -> Builder {
            pager.pageKeyType = type
            return self
        }

        public func build() -> Pager {
            pager
        }
    }

    public func start() {
        tableView.start()
    }

    public func notifyItemsLoaded(count: Int) {
        tableView.notifyItemsLoaded(count: count)
    }
}
