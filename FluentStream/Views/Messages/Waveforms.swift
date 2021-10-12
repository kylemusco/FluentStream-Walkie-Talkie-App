//
//  Waveforms.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/11/21.
//

import SwiftUI

struct Waveforms: View {
    var body: some View {
        Image(systemName: "waveform")
            .padding(.trailing, -10)
        Image(systemName: "waveform")
            .padding(.trailing, -10)
        Image(systemName: "waveform")
    }
}

struct Waveforms_Previews: PreviewProvider {
    static var previews: some View {
        Waveforms()
    }
}
