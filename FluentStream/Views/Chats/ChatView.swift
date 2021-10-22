//
//  ChatView.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct ChatView: View {
    @ObservedObject var chatViewModel = ChatViewModel()
    
    @State var searchText: String = ""
    @State var isAdmin: Bool = true {
        didSet {
            self.chatViewModel.getMessages(self.isAdmin)
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
                    self.chatViewModel.getMessages(isAdmin)
                }
                
                // Display loading message if app is loading chats
                if (chatViewModel.isLoading) {
                    ChatViewLoadingAnimation()
                }
                // Otherwise display chats
                else {
                    SearchBar(searchText: $searchText)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                    // Filter chats by search criteria
                    ForEach(chatViewModel.chats.filter {
                        searchText.isEmpty || $0.filter(searchText)
                    }, id:\.self) { chat in
                        if (self.isAdmin) {
                            AdminNavigationLink(chat: chat)
                        } else {
                            UserNavigationLink(chat: chat)
                        }
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
                        Button(ChatViewModel.username, action: {
                            self.isAdmin = false
                        })
                    } label: {
                        Label("", systemImage: "person.crop.circle")
                            .foregroundColor(.white)
                    }
                }
            }
            .alert(isPresented: $chatViewModel.hasError) {
                // Display alert if server throws error
                Alert(
                    title: Text("Error"),
                    message: Text("There was as an error loading chats"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
