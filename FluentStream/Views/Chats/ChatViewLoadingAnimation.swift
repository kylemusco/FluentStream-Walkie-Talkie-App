//
//  ChatViewLoadingAnimation.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/11/21.
//

import SwiftUI

struct ChatViewLoadingAnimation: View {
        var body: some View {
            HStack {
                Spacer()
                ProgressView()
                Text("   Loading chats...")
                    .font(.system(size: 13.0))
                    .foregroundColor(.gray)
                Spacer()
            }
        }
}

struct ChatViewLoadingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ChatViewLoadingAnimation()
    }
}
