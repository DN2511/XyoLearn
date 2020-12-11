

import Foundation
import UIKit
import ImageIO
import AVFoundation

class FruitsViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Home Button function
    
    @IBAction func homePressed(_ sender: UIButton) {
        
        let hVC = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomePageViewController
        
        self.navigationController?.pushViewController(hVC, animated: false)
    }
    
    //MARK:- Button for Fruits & Custom Alert Initialization
    
    @IBAction func fruitPressed(_ sender: UIButton) {
        
        let customAlert = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "popUpID") as! PopUpViewController
        self.present(customAlert, animated: true, completion:{
        customAlert.view.superview?.isUserInteractionEnabled = true
        customAlert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTap)))
        })

//        self.addChild(customAlert)
//        customAlert.view.frame = self.view.frame
//        self.view.addSubview(customAlert.view)
//        customAlert.didMove(toParent: self)
        
        //MARK:- Image View Initialization
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isAccessibilityElement = true
        customAlert.view.addSubview(imageView)
        
        //MARK:- Loop For Different Images and Sounds
        
        if sender.currentTitle == "1" {
            imageView.loadGif(name: "animatedApple")
            playSound(soundName: "Apple1")
        }
        else if sender.currentTitle == "2" {
            imageView.loadGif(name: "animatedBanana")
            playSound(soundName: "Banana")
        }
        else if sender.currentTitle == "3" {
            imageView.loadGif(name: "animatedOrange")
            playSound(soundName: "Orange1")
        }
        else if sender.currentTitle == "4" {
            imageView.loadGif(name: "animatedWatermelon")
        }
        else if sender.currentTitle == "5" {
            imageView.loadGif(name: "animatedPear")
            playSound(soundName: "Pear1")
        }
        else if sender.currentTitle == "6" {
            imageView.loadGif(name: "animatedStrawberry")
            playSound(soundName: "Strawberry1")
        }
        else {
            imageView.loadGif(name: "animatedGrapes")
            playSound(soundName: "Grape1")
        }
        
        //MARK:- Image Constraints
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
