//
//  ChatView.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct ChatView: View {
    @ObservedObject var chatManager = ChatViewModel()
    
    @State var searchText: String = ""
    @State var isAdmin: Bool = true {
        didSet {
            self.chatManager.getMessages(self.isAdmin)
        }
    }
    
    init() {
        // Sets NavigationView header to blue
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .systemBlue
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        let buttonAppearance = UIBarButtonItemAppearance()
            buttonAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.white]
        
        coloredNavAppearance.backButtonAppearance = buttonAppearance
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                // Handles swipe down gesture to trigger refresh
                PullToRefreshView(coordinateSpaceName: "pullToRefresh") {
                    self.chatManager.getMessages(isAdmin)
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
                        
                        NavigationLink {
                            if (self.isAdmin) {
                                AdminMessageView(chat: chat)
                            } else {
                                UserMessageView(chat: chat)
                            }
                        } label: {
                            if (self.isAdmin) {
                                AdminChatItem(chat: chat)
                            } else {
                                UserChatItem(chat: chat)
                            }
                        }
                        .padding(.leading, -70)
                        .padding(.trailing, -70)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .coordinateSpace(name: "pullToRefresh")
            .navigationBarTitle("Chats")
            .toolbar {
                // Add user management button
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Admin", action: {
                            self.isAdmin = true
                        })
                        Button(ChatViewModel.userName, action: {
                            self.isAdmin = false
                        })
                    } label: {
                        Label("", systemImage: "person.crop.circle")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
