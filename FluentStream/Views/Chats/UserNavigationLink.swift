//
//  UserNavigationLink.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/17/21.
//

import SwiftUI

struct UserNavigationLink: View {
    var chat: Chat
    
    var body: some View {
        NavigationLink {
            UserMessageView(chat: chat)
        } label: {
            UserChatItem(chat: chat)
        }
        .padding(.leading, -70)
        .padding(.trailing, -70)
        .buttonStyle(PlainButtonStyle())
    }
}
