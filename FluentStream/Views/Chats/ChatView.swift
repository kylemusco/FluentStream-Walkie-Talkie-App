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
    
    var body: some View {
        NavigationView {
            List {
                // Display loading message if app is loading chats
                if (chatManager.isLoading) {
                    ChatViewLoadingAnimation()
                }
                // Otherwise display chats
                else {
                    // TODO: Create custom search bar
                    TextField("Search", text: $searchText)
                        .disableAutocorrection(true)
                    
                    ForEach(chatManager.chats.filter {
                        searchText.isEmpty || $0.filter(searchText)
                    }, id:\.self) { chat in
                        // Having this as a NavigationLink creates an empty space at the top of AdminMessageView
                        NavigationLink {
                            AdminMessageView(chat: chat)
                        } label: {
                            AdminChatItem(chat: chat)
                        }
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
