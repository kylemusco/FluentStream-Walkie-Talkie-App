//
//  Message.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/6/21.
//

import Foundation

struct Message: Codable {
    var id: Int
    var timestamp: Date
    var username_from: String?
    var username_to: String?
    var recording: String
}
