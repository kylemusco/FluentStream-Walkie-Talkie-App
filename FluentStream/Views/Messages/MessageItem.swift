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
                // TODO: Get actual audio length
                Text("0:26")
                Waveforms()
                PlayButton(url: URL(string: Constants.URL + message.recording)!)
            }
            .padding(10)
            // Add buffer on edges
            .padding(.leading, 5)
            .padding(.trailing, 5)
            
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : Color.grayMessage)
            .cornerRadius(20)
            
            // Timestamp
            ChatTime(date: message.timestamp)
                .padding(.trailing, 10)
        }
    }
}
