//
//  UserMessageView.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/13/21.
//

import SwiftUI

struct UserMessageView: View {
    var chat: Chat
    
    var body: some View {
        VStack {
            MessageView(messages: chat.messages, currentUser: chat.users[1])
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(self.getUser())
        
        Spacer()
        
    }
    
    func getUser() -> String {
        return self.chat.users[0] != ChatViewModel.username ? self.chat.users[0] : self.chat.users[1]
    }
}
