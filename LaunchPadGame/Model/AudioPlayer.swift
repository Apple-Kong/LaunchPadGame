//
//  AudioPlayer.swift
//  LaunchPadGame
//
//  Created by GOngTAE on 2021/12/19.
//

import Foundation
import AVFoundation



class AudioPlayer {
    static let shared = AudioPlayer()
    
    var player =  AVAudioPlayer()
    var currentItem: Song?
    let songList: [Song] = [Song(name: "ily", singer: "Surf Mesa", bpm: 110, start: 17),
                            Song(name: "ChristMas HipHop", singer: "Unknown", bpm: 99, start: 12),
                            Song(name: "Last ChristMas", singer: "Ariana Grande", bpm: 99, start: 16.3),
                            Song(name: "Save Your Tears", singer: "The Weeknd", bpm: 119, start: 7.4)]
    
    
    func setCurrentItem(songName: String) {
        
        for song in self.songList {
            if song.name == songName {
                self.currentItem = song
                
                guard let name = self.currentItem?.name else {return}
                
                print(name)
                let url = Bundle.main.url(forResource: name, withExtension: "mp3")
                
                if let url = url {
                    do {
                        self.player = try AVAudioPlayer(contentsOf: url)
                        self.player.prepareToPlay()
                        print("complete")


                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
    }
    
    func playCurrentSong() {
        //현재 노래 항목 불러오기
        player.play()
    }
    
    func pause() {
        if player.isPlaying {
            player.pause()
        }
    }
    
//    func createNotes() {
//        guard let bpm = currentItem?.bpm else { return }
//
//        currentItem?.notes = []
//        for i in 10...100 {
//            currentItem?.notes?.append((60 / (Float(bpm)) * Float(i) , Int.random(in: 0...15)))
//        }
//    }
}


extension AudioPlayer {
    
}
