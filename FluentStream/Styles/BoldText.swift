//
//  BoldText.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/11/21.
//

import SwiftUI

struct BoldText: View {
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.medium)
    }
}

struct BoldText_Previews: PreviewProvider {
    static var previews: some View {
        BoldText(text: "Example")
    }
}
