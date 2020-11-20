//
//  PopUpViewController.swift
//  XyloLearn
//
//  Created by Deepanshu Nautiyal on 20/9/20.
//  Copyright © 2020 Deepanshu Nautiyal. All rights reserved.
//


import UIKit
import ImageIO

class PopUpViewController: UIViewController {
    
    var timeLeft = 0
    var myTimer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- Timer for removing the view

        myTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(PopUpViewController.timerRunning), userInfo: nil, repeats: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBOutlet var customView: UIView!
    @IBOutlet var gif: UIImageView!
    
    //MARK:- Timer Function
    
    @objc func timerRunning() {
        self.view.removeFromSuperview()
    }
}
