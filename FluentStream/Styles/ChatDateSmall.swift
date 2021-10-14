//
//  ChatDateSmall.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/13/21.
//

import SwiftUI

struct ChatDateSmall: View {
    var date: Date
    
    var body: some View {
        Text(DateFormatterUtility.format(date: date))
            .font(.system(size: 10.0))
            .foregroundColor(.gray)
    }
}
