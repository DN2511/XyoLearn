

import Foundation
import UIKit
import ImageIO

class AnimalsViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Home Button function
    
    @IBAction func homePressed(_ sender: UIButton) {
        
        let hVC = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomePageViewController
        
        self.navigationController?.pushViewController(hVC, animated: false)
    }
    
    //MARK:- Button for Animals & Custom Alert Initialization
    
    @IBAction func animalPressed(_ sender: UIButton) {
        
        let customAlert = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "popUpID") as! PopUpViewController
        
        self.addChild(customAlert)
        customAlert.view.frame = self.view.frame
        self.view.addSubview(customAlert.view)
        customAlert.didMove(toParent: self)
        
        //MARK:- Image View Initialization
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isAccessibilityElement = true
        customAlert.view.addSubview(imageView)
        
        //MARK:- Loop For Different Images
        
        if sender.currentTitle == "1" {
            imageView.loadGif(name: "animatedCat")
        }
        else if sender.currentTitle == "2" {
            imageView.loadGif(name: "animatedBunny")
        }
        else if sender.currentTitle == "3" {
            imageView.loadGif(name: "animatedFish")
        }
        else if sender.currentTitle == "4" {
            imageView.loadGif(name: "animatedGoat")
        }
        else if sender.currentTitle == "5" {
            imageView.loadGif(name: "animatedLion")
        }
        else if sender.currentTitle == "6" {
            imageView.loadGif(name: "animatedDog")
        }
        else {
            imageView.loadGif(name: "animatedFrog")
        }
        
        //MARK:- Image Constraints
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}

