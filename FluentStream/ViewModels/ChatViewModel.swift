//
//  ChatManager.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/6/21.
//

import Foundation
import Combine

class ChatViewModel: ObservableObject {
    // Static username for demo
    static let username = "kyle_ski"
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    // Data source for "Chats" table
    @Published var chats = [Chat]() {
        willSet { objectWillChange.send() }
    }
    
    // Loading animation is displayed when "true"
    @Published var isLoading: Bool = false {
        willSet { objectWillChange.send() }
    }
    
    // Error alert is displayed when set
    @Published var error: Error? {
        willSet { objectWillChange.send() }
    }
    
    init() {
        // Load messages as admin by default
        self.getMessages(true)
    }
    
    // Queries "/history" endpoint for messages
    func getMessages(_ isAdmin: Bool) {
        // Set to "true" so loading animation is displayed
        self.isLoading = true
        
        URLSession.shared.dataTask(with: URL(string:Constants.URL + "/history")!) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error querying history: ", error!)
                
                // Set error to trigger alert in view
                self.error = error
                self.isLoading = false
                
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
                    // Convert from JSON array into array of Message objects
                    let messages = try decoder.decode([Message].self, from: data)
                    
                    self.chats = self.sortMessagesIntoChats(messages, isAdmin)
                    
                    // Sort users based on permission
                    if (!isAdmin) {
                        self.chats = self.chats.filter {
                            $0.filterByUser(ChatViewModel.username)
                        }
                    }
                } catch {
                    print("Error decoding messages: ", error)
                    
                    // Set error to trigger alert in view
                    self.error = error
                }
                
                // Hide loading animation
                self.isLoading = false
            }
        }.resume()
    }
    
    func sortMessagesIntoChats(_ messages: [Message], _ isAdmin: Bool) -> [Chat] {
        var chats = [Chat]()
        
        for message in messages {
            // If chat exists, add message
            if let chat = self.getChatForUsers(user1: message.username_to ?? "",
                                               user2: message.username_from ?? "",
                                               chats: chats) {
                chat.messages.append(message)

                // Check for last message
                if (message.timestamp > chat.dateOfLastMessage) {
                    chat.dateOfLastMessage = message.timestamp
                }
            // Otherwise create new chat
            } else {
                var users = [String]()
                if (isAdmin) {
                    // Sort users alphabetically
                    users = [message.username_from ?? "", message.username_to ?? ""].sorted()
                } else {
                    // Keep "from" first so it's displayed in Chat view
                    users = [message.username_from ?? "", message.username_to ?? ""]
                }
                
                let chat = Chat(users: users, dateOfLastMessage: message.timestamp, messages: [message])

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
            if ((c.users[0] == user1 && c.users[1] == user2) ||
                (c.users[0] == user2 && c.users[1] == user1)) {
                return c
            }
        }
        
        return nil
    }
    
}
