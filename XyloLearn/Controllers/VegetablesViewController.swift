

import Foundation
import UIKit
import ImageIO

class VegetablesViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func vegetablePressed(_ sender: UIButton) {
        
        //MARK:- Custom Alert Initialization
        
        let customAlert = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "popUpID") as! PopUpViewController
        
        self.addChild(customAlert)
        customAlert.view.frame = self.view.frame
        self.view.addSubview(customAlert.view)
        customAlert.didMove(toParent: self)
        
        //MARK:- Image View Initialization
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isAccessibilityElement = true
        customAlert.view.addSubview(imageView)
        
        //MARK:- Loop For Different Images
        
        if sender.currentTitle == "1" {
            imageView.loadGif(name: "animatedBroccoli")
        }
        else if sender.currentTitle == "2" {
            imageView.loadGif(name: "animatedCarrot")
        }
        else if sender.currentTitle == "3" {
            imageView.loadGif(name: "animatedCapsicum")
        }
        else if sender.currentTitle == "4" {
            imageView.loadGif(name: "animatedPumpkin")
        }
        else if sender.currentTitle == "5" {
            imageView.loadGif(name: "animatedMushroom")
        }
        else if sender.currentTitle == "6" {
            imageView.loadGif(name: "animatedPotato")
        }
        else {
            imageView.loadGif(name: "animatedPeas")
        }
        
        //MARK:- Image Constraints
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
