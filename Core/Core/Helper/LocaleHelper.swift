//
// Created by Shaban Kamel on 05/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

public struct LocaleHelper {

   public static func isEn() -> Bool {
        Locale.current.languageCode == "en"
    }
}
