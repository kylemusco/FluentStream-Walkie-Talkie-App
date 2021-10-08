//
//  ChatUser.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import SwiftUI

struct ChatUser: View {
    var user: String
    
    var body: some View {
        Text(user)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ChatUser_Previews: PreviewProvider {
    static var previews: some View {
        ChatUser(user: "Test")
    }
}
