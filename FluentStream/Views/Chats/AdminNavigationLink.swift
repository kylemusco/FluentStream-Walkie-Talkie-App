//
//  AdminNavigationLink.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/16/21.
//

import SwiftUI

struct AdminNavigationLink: View {
    var chat: Chat
    
    var body: some View {
        NavigationLink {
            AdminMessageView(chat: chat)
        } label: {
            AdminChatItem(chat: chat)
        }
        .padding(.leading, -70)
        .padding(.trailing, -70)
        .buttonStyle(PlainButtonStyle())
    }
}
