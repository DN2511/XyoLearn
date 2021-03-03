//
//  instructionViewControler.swift
//  XyloLearn
//
//  Created by Deepanshu Nautiyal on 23/12/20.
//  Copyright © 2020 Deepanshu Nautiyal. All rights reserved.
//

import Foundation
import UIKit

class instructionsViewController: UIViewController {
    
    @IBOutlet  var gifBackground: UIImageView!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
                gifBackground.loadGif(name: "Instructions")
    }
}
