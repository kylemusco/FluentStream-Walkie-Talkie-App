//
//  DateFormatter.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import Foundation

class DateFormatterUtility {
    // Converts date from "2021-10-18T00:10:13+0000" to "Oct 18 12:10 AM"
    static func format(date: Date) -> String {
        return formatter.string(from: date)
    }
    
    // Returns time from date
    static func time(date: Date) -> String {
        return timeFormatter.string(from: date)
    }
    
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d hh:mm a"
        return formatter
    }()
    
    private static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
}
