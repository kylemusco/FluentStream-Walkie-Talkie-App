//
//  DateFormatter.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import Foundation

class DateFormatterUtility {
    // Converts date to "2021-10-18T00:10:13+0000" "Oct 18 12:10 AM"
    static func format(date: Date) -> String {
        return formatter.string(from: date)
    }
    
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d hh:mm a"
        return formatter
    }()
}
