//
//  UserMenu.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/13/21.
//

import SwiftUI

struct UserMenu: View {
    private var chatManager = ChatManager.shared
    
    var body: some View {
        Menu {
            Button("Admin", action: {
                self.chatManager.getMessages(true)
            })
            Button(ChatManager.userName, action: {
                self.chatManager.getMessages(false)
            })
        } label: {
            Label("", systemImage: "person.crop.circle")
                .foregroundColor(.white)
        }
    }
}


