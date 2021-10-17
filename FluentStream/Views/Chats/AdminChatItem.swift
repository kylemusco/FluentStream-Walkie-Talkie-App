//
//  AdminChatItem.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import SwiftUI

struct AdminChatItem: View {
    var chat: Chat
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ChatUser(user: chat.users[0])
                ChatUser(user: chat.users[1])
            }
            .frame(width: 175)
            .padding(.leading, 15)
            
            ChatDate(date: chat.dateOfLastMessage)
                .frame(width:125, alignment: .leading)
            
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
        .padding(8)
    }
}
