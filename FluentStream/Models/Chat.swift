//
//  Chat.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/6/21.
//

import Foundation

class Chat: NSObject {
    var user1: String
    var user2: String
    var dateOfLastMessage: Date
    var messages: [Message]
    
    init(user1: String, user2: String, dateOfLastMessage: Date, messages: [Message]) {
        self.user1 = user1
        self.user2 = user2
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
            self.user1.lowercased().contains(predicate) ||
            self.user2.lowercased().contains(predicate) ||
            dateAsString.contains(predicate)
        )
    }
    
    // Returns true if chat includes a specific user
    func filterByUser(_ user: String) -> Bool {
        return self.user1.lowercased() == user.lowercased() || self.user2.lowercased() == user.lowercased()
    }
}
