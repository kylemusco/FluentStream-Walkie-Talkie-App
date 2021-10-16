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
            MessageView(messages: chat.messages, currentUser: chat.user2)
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(self.getUser())
        
        Spacer()
        
    }
    
    func getUser() -> String {
        return self.chat.user1 != ChatViewModel.userName ? self.chat.user1 : self.chat.user2
    }
}
