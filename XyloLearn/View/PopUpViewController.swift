//
//  PopUpViewController.swift
//  XyloLearn
//
//  Created by Deepanshu Nautiyal on 20/9/20.
//  Copyright © 2020 Deepanshu Nautiyal. All rights reserved.
//


import UIKit
import ImageIO
import AVFoundation

class PopUpViewController: UIViewController {
    
    var timeLeft = 0
    var myTimer = Timer()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        stopPlayer()
        
        //MARK:- Timer for removing the view

        myTimer = Timer.scheduledTimer(timeInterval: 27.0, target: self, selector: #selector(PopUpViewController.timerRunning), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        }
    
    @IBOutlet unowned var customView: UIView!
    @IBOutlet unowned var gif: UIImageView!
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.removeFromSuperview()
        player?.stop()
        myTimer.invalidate()
        playSoundOnLoop(soundName: "Background")
    }
    
    deinit {
        customView.removeFromSuperview()
        gif.removeFromSuperview()
    }

    //MARK:- Timer Function
    
    @objc func timerRunning() {
        self.view.removeFromSuperview()
    }
}


