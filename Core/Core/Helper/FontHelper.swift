//
// Created by mac on 2019-07-12.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

class FontHelper {

    func printAllFonts() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }

}