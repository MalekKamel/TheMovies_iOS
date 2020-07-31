//
// Created by mac on 2019-06-18.
// Copyright (c) 2019 A. All rights reserved.
//

import UIKit

class DatePicker: UIDatePicker {
    private var callback: ((Date) -> Void)!

    func create(
            pickerMode: UIDatePicker.Mode = .date,
            callback: @escaping (Date) -> Void
    ) -> DatePicker {
        self.callback = callback
        timeZone = NSTimeZone.local
        backgroundColor = UIColor.white
        addTarget(
                self,
                action: #selector(datePickerValueChanged),
                for: .valueChanged
        )
        datePickerMode = pickerMode
        return self
    }

    @objc
    func datePickerValueChanged(_ sender: UIDatePicker){

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        let selectedDate: String = dateFormatter.string(from: sender.date)

        print("Selected = \(selectedDate)")
        callback(sender.date)
    }

}

