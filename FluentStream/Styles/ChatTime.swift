//
//  ChatTime.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/11/21.
//

import SwiftUI

struct ChatTime: View {
    var date: Date
    
    var body: some View {
        Text(DateFormatterUtility.time(date: date))
            .font(.system(size: 10.0))
            .foregroundColor(.gray)
    }
}
