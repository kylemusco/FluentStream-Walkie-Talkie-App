//
//  ChatDate.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/7/21.
//

import SwiftUI

struct ChatDate: View {
    var date: Date
    
    var body: some View {
        Text(DateFormatterUtility.format(date: date))
            .font(.system(size: 13.0))
            .foregroundColor(.gray)
    }
}
