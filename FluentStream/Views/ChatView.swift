//
//  ChatView.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatManager = ChatManager.shared
    
    @State var searchText: String = ""
    
    // TODO: Loading indicator
    
    var body: some View {
        NavigationView {
            List {
                // TODO: Create custom search bar
                TextField("Search", text: $searchText)
                    .cornerRadius(8)
                
                ForEach(chatManager.chats.filter {
                    searchText.isEmpty || $0.filter(searchText)
                }, id:\.self) { chat in
                    NavigationLink {
                        Text("inner")
                    } label: {
                        AdminChatItem(chat: chat)
                    }
                }
            }
            .navigationBarTitle("Chats")
        }
        
        // https://stephenf.codes/blog/how-to-make-custom-list-rows
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
