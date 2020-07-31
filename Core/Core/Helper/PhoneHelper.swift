//
//  PhoneHelper.swift
//  Core
//
//  Created by Shaban Kamel on 31/7/2020.
//  Copyright © 2019 Shaban Kamel. All rights reserved.
//

import Foundation

public struct PhoneHelper {
    public static func format(code: String, number: String) -> String {
        "\(code)-\(number)"
    }
}
