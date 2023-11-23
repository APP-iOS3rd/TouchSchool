//
//  Audio.swift
//  TouchSchool
//
//  Created by 황성진 on 11/19/23.
//

import SwiftUI
import AVFoundation

class SoundSetting: ObservableObject {
    static let instance = SoundSetting()
    private var players: [SoundOption: AVAudioPlayer] = [:]

    enum SoundOption: String, CaseIterable {
        case mainBGM = "mainBGM"
        case buttonBGM = "buttomBGM"
        case errorBGM = "errorBGM"
    }

    init() {
        for sound in SoundOption.allCases {
            if let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") {
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    player.prepareToPlay()
                    players[sound] = player
                } catch {
                    print("오디오 플레이어 초기화 실패: \(error)")
                }
            } else {
                print("사운드 파일 로드 실패: \(sound.rawValue).mp3")
            }
        }
    }

    func playSound(sound: SoundOption) {
        DispatchQueue.global().async {
            if let player = self.players[sound], !player.isPlaying {
                player.play()
                player.volume = 0.1
            }
        }
    }

    func playLoop(sound: SoundOption) {
        DispatchQueue.global().async {
            if let player = self.players[sound] {
                player.numberOfLoops = 10
                player.volume = 0.1
                if !player.isPlaying {
                    player.play()
                }
            }
        }
    }

    func stopSounds(sound: SoundOption) {
            if let player = players[sound], player.isPlaying {
                player.stop()
                player.currentTime = 0
            }
    }

}

