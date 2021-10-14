//
//  AdminMessageView.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import SwiftUI

struct AdminMessageView: View {
    var chat: Chat
    
    var body: some View {
        VStack {
            HStack {
                BoldText(text: chat.user1)
                Spacer()
                BoldText(text: chat.user2)
            }
            .frame(height: 10)
            .padding(.bottom, 30)
            
            MessageView(messages: chat.messages, currentUser: chat.user2)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Messages")
        
        Spacer()
        
    }
}
