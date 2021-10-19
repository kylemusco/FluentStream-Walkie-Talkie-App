//
//  SearchBar.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/11/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            // Magnifying glass icon
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            // Text input
            TextField("Search", text: $searchText)
                .modifier(ClearButton(text: $searchText))
                .disableAutocorrection(true)
                .accentColor(.gray)
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.lightGray)
        )
    }
}
