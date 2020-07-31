//
// Created by Shaban Kamel on 04/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxRequester
import Data

public class ListVCBuilder {
    public static func make(
            items: [String] = [],
            title: String? = nil,
            onItemSelected: @escaping (String, Int) -> Void
    ) -> ListVC {
        let vc = ListVC()
        vc.onItemSelected = onItemSelected
        vc.items = items
        vc.listTitle = title
        return vc
    }
}
