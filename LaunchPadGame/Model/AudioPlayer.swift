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
    let songList: [Song] = [Song(name: "ily", singer: "Surf Mesa", bpm: 110), Song(name: "ChristMas HipHop", singer: "Unknown", bpm: 99)]
    
    
    func setCurrentItem(songName: String) {
        for song in songList {
            if song.name == songName {
                currentItem = song
                
                guard let name = currentItem?.name else {return}
                let url = Bundle.main.url(forResource: name, withExtension: "mp3")
                
                if let url = url {
                    do {
                        player = try AVAudioPlayer(contentsOf: url)
                        player.prepareToPlay()
                        
                        //노트 생성
                        self.createNotes()

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
    
    func createNotes() {
        guard let bpm = currentItem?.bpm else { return }
        
        currentItem?.notes = []
        for i in 10...100 {
            currentItem?.notes?.append((60 / (Float(bpm)) * Float(i) , Int.random(in: 0...15)))
        }
        
        print(currentItem?.notes)
    }
}


extension AudioPlayer {
    
}
