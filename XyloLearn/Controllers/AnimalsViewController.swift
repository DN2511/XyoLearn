

import Foundation
import UIKit
import ImageIO
import AVFoundation

class AnimalsViewController: UIViewController{
    
   unowned var player: AVAudioPlayer!
    
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
        self.present(customAlert, animated: false, completion:{
        customAlert.view.superview?.isUserInteractionEnabled = true
        customAlert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTap)))
            })
   
//        self.addChild(customAlert)
        customAlert.view.frame = self.view.frame
        self.view.addSubview(customAlert.view)
        customAlert.didMove(toParent: self)
        
        //MARK:- Image View Initialization
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isAccessibilityElement = true
        customAlert.view.addSubview(imageView)
        
        //MARK:- Loop For Different Images and Sounds
        
        if sender.currentTitle == "1" {
            imageView.loadGif(name: "animatedBunny")
            playSound(soundName: "Bunny")
        }
        else if sender.currentTitle == "2" {
            imageView.loadGif(name: "animatedFrog")
            playSound(soundName: "Frog")
        }
        else if sender.currentTitle == "3" {
            imageView.loadGif(name: "animatedLion")
            playSound(soundName: "Lion")
        }
        else if sender.currentTitle == "4" {
            imageView.loadGif(name: "animatedGoat")
            playSound(soundName: "Goat")
        }
        else if sender.currentTitle == "5" {
            imageView.loadGif(name: "animatedFish")
            playSound(soundName: "Fish")
        }
        else if sender.currentTitle == "6" {
            imageView.loadGif(name: "animatedCat")
            playSound(soundName: "Cat")
        }
        else {
            imageView.loadGif(name: "animatedDog")
            playSound(soundName: "Dog")
        }
        
        //MARK:- Image Constraints
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.bottomAnchor).isActive = true        
    }
}

