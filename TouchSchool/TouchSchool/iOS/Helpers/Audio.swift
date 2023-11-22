//
//  Audio.swift
//  TouchSchool
//
//  Created by 황성진 on 11/19/23.
//

import SwiftUI
import AVKit

class SoundSetting: ObservableObject {
    
    //1. soundSetting의 단일 인스턴스를 만듬
    /// singleton ? :
    /*싱글 톤은 한 번만 생성 된 다음 사용해야하는 모든 곳에서 공유해야하는 객체입니다 */
    static let instance = SoundSetting()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case mainBGM = "mainBGM"
        case buttonBGM = "buttonBGM"
        case errorBGM = "errorBGM"
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            player?.volume = 1
        } catch {
            print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }
    
    func playLoop(sound: SoundOption) {
        let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.numberOfLoops =  10
        player?.play()
        player?.volume = 0.2
    }
    
}
