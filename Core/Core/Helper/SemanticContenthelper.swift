//
// Created by mac on 2019-07-03.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

public class SemanticContentHelper {

    public static func forceRtl(view: UIView) {
        view.semanticContentAttribute = .forceRightToLeft
    }

    public static func forceRtl() {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
    }
}
