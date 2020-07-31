//
// Created by Sha on 2019-03-01.
// Copyright (c) 2019 A. All rights reserved.
//
import UIKit

// 1
private var maxLengths = [UITextField: Int]()

// 2
extension FormEntryTextField {

    // 3
    @IBInspectable var maxLength: Int {
        get {
            // 4
            guard let length = maxLengths[self] else {
                return Int.max
            }
            return length
        }
        set {
            maxLengths[self] = newValue
            // 5
            addTarget(
                    self,
                    action: #selector(limitLength),
                    for: UIControl.Event.editingChanged
            )
        }
    }

    @objc func limitLength(textField: UITextField) {
        // 6
        guard let prospectiveText = textField.text, prospectiveText.count > maxLength else {
            return
        }

        let selection = selectedTextRange
        // 7
        text = String(prospectiveText[prospectiveText.startIndex ..< prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)])


        selectedTextRange = selection
    }

}
