//
//  HomePageViewController.swift
//  XyloLearn
//
//  Created by Deepanshu Nautiyal on 30/7/20.
//  Copyright © 2020 Deepanshu Nautiyal. All rights reserved.
//

import UIKit

class StartupPageViewController: UIViewController {
    
    @IBOutlet var gifBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gifBackground.loadGif(name: "homeGif")

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {

                // Navigate to HomePageViewController

                let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomePageViewController
                self.navigationController?.pushViewController(vc2, animated: false)
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        gifBackground.loadGif(name: "homeGif")
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
//                
//                // Navigate to HomePageViewController
//                
//                let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomePageViewController
//                self.navigationController?.pushViewController(vc2, animated: false)
//
//        }
    }
}


