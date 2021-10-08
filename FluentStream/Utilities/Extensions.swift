//
//  Extensions.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import Foundation

// MARK: DateFormatter
extension DateFormatter {
  static let secondsAsString: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "ssssssssss"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}
