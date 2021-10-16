//
//  PlayButton.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/11/21.
//

import SwiftUI
import AVKit

struct PlayButton: View {
    var url: URL
    
    @State var audioPlayer: AVPlayer!
    @State private var isPlaying = false
    
    var body: some View {
        VStack {
            if (!self.isPlaying) {
                Button(action: {
                    self.audioPlayer.play()
                    self.isPlaying = true
                }) {
                    Image(systemName: "play.circle")
                }
                .onAppear {
                    let playerItem = AVPlayerItem(url: url)
                    self.audioPlayer = AVPlayer(playerItem:playerItem)
                }
            } else {
                Button(action: {
                    self.audioPlayer.pause()
                    self.isPlaying = false
                }) {
                    Image(systemName: "pause.circle")
                }
            }
        }
    }
}
