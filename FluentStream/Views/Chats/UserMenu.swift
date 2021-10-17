//
//  UserMenu.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/13/21.
//

import SwiftUI

struct UserMenu: View {
    @ObservedObject private var chatManager = ChatViewModel()
    
    var body: some View {
        Menu {
            Button("Admin", action: {
                self.chatManager.getMessages(true)
            })
            Button(ChatViewModel.username, action: {
                self.chatManager.getMessages(false)
            })
        } label: {
            Label("", systemImage: "person.crop.circle")
                .foregroundColor(.white)
        }
    }
}


