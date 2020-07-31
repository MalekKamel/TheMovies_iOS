//
// Created by mac on 2019-04-16.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit.UITextField

extension FormEntryTextField {

    public func validate(
            type: ValidatorType = .requiredField,
            result: ValidationResult? = nil
    ) -> ValidationInfo {
        let validator = ValidatorFactory.validatorFor(type: type)
        let isValid = validator.validate(self) { error in

            guard let result = result else {
                self.error = error
                return
            }

            result(error)
        }
        return ValidationInfo(isValid: isValid)
    }

}