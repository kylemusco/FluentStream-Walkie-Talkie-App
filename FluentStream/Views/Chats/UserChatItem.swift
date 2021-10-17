//
//  UserChatItem.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/13/21.
//

import SwiftUI

struct UserChatItem: View {
    var chat: Chat
    
    var body: some View {
        HStack(alignment: .center) {
            // User Icon
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.lightGray)
                .padding(.leading, 15)
            
            // Username and last message time
            VStack(alignment: .leading) {
                ChatUser(user: chat.users[0])
                
                HStack {
                    Text("Last message:")
                        .font(.system(size: 10.0))
                        .foregroundColor(.gray)
                    
                    ChatDateSmall(date: chat.dateOfLastMessage)
                        .font(.system(size: 10.0))
                        .frame(width:125, alignment: .leading)
                }
                
            }
            .frame(width: 270)
            .padding(.leading, 10)
            
            // Row select icon
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .padding(.leading, -15)
                .padding(.trailing, 10)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(color: Color.lightGray, radius: 3, x: 0, y: 2)
                .frame(height: 55)
                
        )
        .padding(10)
    }
}
