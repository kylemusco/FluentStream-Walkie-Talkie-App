//
//  ChatManager.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/6/21.
//

import Foundation
import Combine

class ChatManager: ObservableObject {
    static let shared = ChatManager()
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @Published var chats = [Chat]() {
        willSet { objectWillChange.send() }
    }
    
    @Published var isLoading: Bool = false {
        willSet { objectWillChange.send() }
    }
    
    init() {
        self.getMessages(true)
    }
    
    // Queries "/history" endpoint for messages
    func getMessages(_ isAdmin: Bool) {
        isLoading = true
        
        URLSession.shared.dataTask(with: URL(string:Constants.URL + "/history")!) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error querying history")
                return
            }
            
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    
                    // Convert from "1632172544" to Date
                    decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
                        let container = try decoder.singleValueContainer()
                        let dateStr = try container.decode(String.self)
                        let dateAsInt = Int(dateStr)!
                        
                        return Date(timeIntervalSince1970: TimeInterval(dateAsInt))
                    })
                    
                    let messages = try decoder.decode([Message].self, from: data)
                    
                    self.chats = self.sortMessagesIntoChats(messages: messages)
                    
                    if (!isAdmin) {
                        self.chats = self.chats.filter {
                            $0.filterByUser("kyle_ski")
                        }
                    }
                    
                    self.isLoading = false
                } catch {
                    print("Error decoding messages: ", error)
                }
            }
        }.resume()
    }
    
    func sortMessagesIntoChats(messages: [Message]) -> [Chat] {
        var chats = [Chat]()
        
        for message in messages {
            // If chat exists, add message
            if let chat = self.getChatForUsers(user1: message.username_to ?? "", user2: message.username_from ?? "", chats: chats) {
                chat.messages.append(message)

                // Check for last message
                if (message.timestamp > chat.dateOfLastMessage) {
                    chat.dateOfLastMessage = message.timestamp
                }
            // Otherwise create new chat
            } else {
                // Sort users alphabetically
                let users = [message.username_from ?? "", message.username_to ?? ""].sorted()
                let chat = Chat(user1: users[0], user2: users[1], dateOfLastMessage: message.timestamp, messages: [message])

                chats.append(chat)
            }
        }
        
        // Sort based on date of last message
        chats = chats.sorted { $0.dateOfLastMessage > $1.dateOfLastMessage }
        
        return chats
    }
    
    // Returns existing chat object or nil for given usernames
    private func getChatForUsers(user1: String, user2: String, chats: [Chat]) -> Chat? {
        for c in chats {
            if ((c.user1 == user1 && c.user2 == user2) ||
                (c.user1 == user2 && c.user2 == user1)) {
                return c
            }
        }
        
        return nil
    }
    
}
