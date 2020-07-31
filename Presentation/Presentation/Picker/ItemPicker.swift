//
// Created by Shaban Kamel on 05/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import UIKit

public class ItemPicker<T: CustomStringConvertible>: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    private var list: [T] = []
    private var callback: ((T) -> Void)!
    private var isFirstDisplay = true

    public func create(
            list: [T],
            callback: @escaping (T) -> Void
    ) -> ItemPicker<T>{
        self.list = list
        self.callback = callback
        delegate = self
        dataSource = self
        return self
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { list.count }

    public func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectDefaultItem(row: row)
        return list[row].description
    }

    private func selectDefaultItem(row: Int) {
        guard isFirstDisplay, row == 0  else { return }
        // select the first item on the first display
        callback(list[row])
        isFirstDisplay = false
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callback(list[row])
    }

    public override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
    }
}