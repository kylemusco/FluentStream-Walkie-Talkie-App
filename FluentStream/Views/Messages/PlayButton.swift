//
//  PlayButton.swift
//  FluentStream
//
//  Created by Kyle Musco on 10/11/21.
//

import SwiftUI
import AVKit

struct PlayButton: View {
    @State var audioPlayer: AVAudioPlayer!
    
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
                    let sound = NSDataAsset(name: "sample_recording")?.data
                    self.audioPlayer = try! AVAudioPlayer(data: sound!)
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
