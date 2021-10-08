//
//  AdminChatItem.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import SwiftUI

struct AdminChatItem: View {
    var chat: Chat
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ChatUser(user: chat.user1)
                ChatUser(user: chat.user2)
            }
            .frame(width: 175)
            
            ChatDate(date: chat.dateOfLastMessage)
                .frame(width:125, alignment: .leading)
        }
    }
}
