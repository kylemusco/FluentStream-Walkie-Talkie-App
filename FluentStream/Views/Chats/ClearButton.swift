//
//  ClearButton.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/11/21.
//

import SwiftUI

public struct ClearButton: ViewModifier {
    @Binding var text: String

    public func body(content: Content) -> some View {
        HStack {
            // Content of TextField
            content
            
            // Add spacer to right justify button
            Spacer()
            
            // Cancel button icon
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(.secondary)
                .opacity(text == "" ? 0 : 0.5)
                .onTapGesture { self.text = "" }
        }
    }
}
