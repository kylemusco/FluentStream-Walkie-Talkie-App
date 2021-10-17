//
//  Chat.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/6/21.
//

import Foundation

class Chat: NSObject {
    var users: [String]
    var dateOfLastMessage: Date
    var messages: [Message]
    
    init(users: [String], dateOfLastMessage: Date, messages: [Message]) {
        self.users = users
        self.dateOfLastMessage = dateOfLastMessage
        self.messages = messages
    }
    
    // MARK: Helper Functions
    
    // Checks for matching users or date of last message
    // Returns true if chat matches search criteria
    func filter(_ text: String) -> Bool {
        let predicate = text.lowercased()
        let dateAsString = DateFormatterUtility.format(date: self.dateOfLastMessage).lowercased()
        
        return (
            self.users[0].lowercased().contains(predicate) ||
            self.users[1].lowercased().contains(predicate) ||
            dateAsString.contains(predicate)
        )
    }
    
    // Returns true if chat includes a specific user
    func filterByUser(_ user: String) -> Bool {
        return self.users[0].lowercased() == user.lowercased() || self.users[1].lowercased() == user.lowercased()
    }
}
