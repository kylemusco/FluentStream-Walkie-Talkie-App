//
//  MessageView.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import SwiftUI

struct MessageView: View {
    var messages: [Message]
    var currentUser: String
    
    var body: some View {
        ScrollView {
            ForEach(messages, id: \.self) { message in
                MessageItem(message: message, isCurrentUser: message.username_from == currentUser)
                    .frame(maxWidth: .infinity, alignment: message.username_from == currentUser ? .trailing : .leading)
            }
        }
        .padding(.top, -20)
    }
}
