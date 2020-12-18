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
        
        //MARK:- Timer for removing the view

        myTimer = Timer.scheduledTimer(timeInterval: 25.0, target: self, selector: #selector(PopUpViewController.timerRunning), userInfo: nil, repeats: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        }
    
    @IBOutlet var customView: UIView!
    @IBOutlet var gif: UIImageView!
    
//    override func viewWillDisappear(_ animated: Bool) {
//        player?.stop()
//    }
    

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.removeFromSuperview()
        player?.stop()
        myTimer.invalidate()
    }

    //MARK:- Timer Function
    
    @objc func timerRunning() {
        self.view.removeFromSuperview()
    }
}


