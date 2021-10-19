//
//  MessageItem.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import SwiftUI

struct MessageItem: View {
    var message: Message
    var isCurrentUser: Bool
    
    var body: some View {
        VStack(alignment: .trailing) {
            // Message body
            HStack {
                Text("0:26")
                Waveforms()
                PlayButton(url: URL(string: Constants.URL + message.recording)!)
            }
            .padding(10)
            .padding(.leading, 5)
            .padding(.trailing, 5)
            
            // Set text to white if message is from current user, otherwise black
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            
            // Set background to blue if message is from current user, otherwise gray
            .background(isCurrentUser ? Color.blue : Color.grayMessage)
            .cornerRadius(20)
            
            // Timestamp
            ChatTime(date: message.timestamp)
                .padding(.trailing, 10)
        }
    }
}
