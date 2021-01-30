//
//  HomePageViewController.swift
//  XyloLearn
//
//  Created by Deepanshu Nautiyal on 30/7/20.
//  Copyright © 2020 Deepanshu Nautiyal. All rights reserved.
//

import UIKit
import AVFoundation

class StartupPageViewController: UIViewController {
    
     var myTimer = Timer()
    unowned var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet unowned var gifBackground: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        gifBackground.loadGif(name: "homeGif")
        playSound(soundName: "XyloLearn")
        
        myTimer = Timer.scheduledTimer(withTimeInterval:5.0, repeats: false) { [unowned self] (myTimer) in
            self.navigate()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        myTimer.invalidate()
        gifBackground.stopAnimating()
        gifBackground.removeFromSuperview()
        stopPlayer()
    }
    
    deinit {
        print("deinit worked")
    }
    
    func navigate(){
        let vc2 =  self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomePageViewController
        self.navigationController?.pushViewController(vc2, animated: false)
    }
}



