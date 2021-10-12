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
            ScrollView {
                // Handles swipe down gesture to trigger refresh
                PullToRefreshView(coordinateSpaceName: "pullToRefresh") {
                    self.chatManager.getMessages()
                }
                
                // Display loading message if app is loading chats
                if (chatManager.isLoading) {
                    ChatViewLoadingAnimation()
                }
                // Otherwise display chats
                else {
                    SearchBar(searchText: $searchText)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                    ForEach(chatManager.chats.filter {
                        searchText.isEmpty || $0.filter(searchText)
                    }, id:\.self) { chat in
                        // Having this as a NavigationLink creates an empty space at the top of AdminMessageView
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
            }
            .coordinateSpace(name: "pullToRefresh")
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
