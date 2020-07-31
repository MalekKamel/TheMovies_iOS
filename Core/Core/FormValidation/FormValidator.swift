//
// Created by mac on 2019-04-18.
// Copyright (c) 2019 A. All rights reserved.
//

import Foundation

public class FormValidator {

    public static func isValid(fields: [ValidationInfo]) -> Bool {
        var isValid = true
        fields.forEach { info in
            isValid = info.isValid && isValid
        }
        return isValid
    }

}