//
// Created by Shaban Kamel on 05/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import CountryPicker

public class CountryPickerHelper {
    private var onSelectCountry: ((String, String) -> Void)!
    private weak var picker: CountryPicker!
    public var selectedCountryCode: String = ""

    public init(picker: CountryPicker, onSelectCountry: @escaping (String, String) -> Void) {
        self.picker = picker
        self.onSelectCountry = onSelectCountry
        setUpPicker()
    }

    private func setUpPicker() {
        let locale = Locale.current
        let code = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String?

        let theme = CountryViewTheme(
                countryCodeTextColor: .black,
                countryNameTextColor: .black,
                rowBackgroundColor: .clear,
                showFlagsBorder: false
        )
        picker.theme = theme
        picker.countryPickerDelegate = self
        picker.showPhoneNumbers = true
        picker.setCountry(code!)
    }

    public func show() {
        picker.isHidden = false
    }

    public func hide() {
        picker.isHidden = true
    }

    public func toggleVisibility() {
        picker.isHidden = !picker.isHidden
    }
}

extension CountryPickerHelper: CountryPickerDelegate {
    // a picker item was selected
    public func countryPhoneCodePicker(
            _ picker: CountryPicker,
            didSelectCountryWithName name: String,
            countryCode: String,
            phoneCode: String,
            flag: UIImage
    ) {
        let cs = CharacterSet.init(charactersIn: "+")
        let countryCode = phoneCode.trimmingCharacters(in: cs)
        onSelectCountry(phoneCode, countryCode)
        selectedCountryCode = countryCode
    }
}