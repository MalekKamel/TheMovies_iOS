//
// Created by Shaban Kamel on 16/02/2020.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation

public class AppDateFormatter {
    public static func date(isoDateString: String) -> Date {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions =  [.withInternetDateTime, .withDashSeparatorInDate, .withColonSeparatorInTime, .withTimeZone]
        let date = formatter.date(from: isoDateString)
        return date!
    }

    static func string(date: String, dateFormat: String = "MM/dd/yy hh:mm") -> String {
        string(date: date.iso8601Date(), dateFormat: dateFormat)
    }

    static func string(date: Date, dateFormat: String = "MM/dd/yy hh:mm") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = dateFormat
        return formatter.string(from: date)
    }
}

public extension String {
    func iso8601Date() -> Date {
        AppDateFormatter.date(isoDateString: self)
    }

    func readableDate() -> String {
        AppDateFormatter.string(date: self)
    }
}