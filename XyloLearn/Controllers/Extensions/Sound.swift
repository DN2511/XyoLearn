//
//  Sound.swift
//  XyloLearn
//
//  Created by Deepanshu Nautiyal on 8/12/20.
//  Copyright © 2020 Deepanshu Nautiyal. All rights reserved.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?

func playSound(soundName: String){
    guard let path = Bundle.main.path(forResource: soundName, ofType: "wav") else { return }
    let url = URL(fileURLWithPath: path)
    do {
        player = try AVAudioPlayer(contentsOf:  url)
        player?.numberOfLoops = -1
        player?.prepareToPlay()
        player?.play()
    } catch {
        print("Couldn't Load the Sound File..")
    }
}

func stopPlayer() {
    player?.stop()
}

