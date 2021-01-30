

import Foundation
import UIKit
import ImageIO
import AVFoundation

class ShapesViewController: UIViewController {
    
    unowned var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Home Button function
    
    @IBAction func homePressed(_ sender: UIButton) {
        
        let hVC = self.storyboard?.instantiateViewController(withIdentifier: "Home")as! HomePageViewController
        
        self.navigationController?.pushViewController(hVC, animated: false)
    }
    
    //MARK:- Button for Shapes & Custom Alert Initialization
    
    @IBAction func shapePressed(_ sender: UIButton) {
        
        let customAlert = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "popUpID") as! PopUpViewController
        self.present(customAlert, animated: true, completion:{
        customAlert.view.superview?.isUserInteractionEnabled = true
        customAlert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTap)))
        })
        
//        self.addChild(customAlert)
//        customAlert.view.frame = self.view.frame
//        self.view.addSubview(customAlert.view)
//        customAlert.didMove(toParent: self)
        
        customAlert.view.contentMode = .scaleAspectFill
        
        //MARK:- Image View Initialization
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isAccessibilityElement = true
        customAlert.view.addSubview(imageView)
        
        //MARK:- Loop For Different Images and Sounds
        
        if sender.currentTitle == "1" {
            imageView.loadGif(name: "animatedRectangle")
            playSound(soundName: "Rectangle")
        }
        else if sender.currentTitle == "2" {
            imageView.loadGif(name: "animatedCircle")
            playSound(soundName: "Circle")
        }
        else if sender.currentTitle == "3" {
            imageView.loadGif(name: "animatedTriangle")
            playSound(soundName: "Triangle")
        }
        else if sender.currentTitle == "4" {
            imageView.loadGif(name: "animatedHeart")
            playSound(soundName: "Heart")
        }
        else if sender.currentTitle == "5" {
            imageView.loadGif(name: "animatedStar")
            playSound(soundName: "Star")
        }
        else if sender.currentTitle == "6" {
            imageView.loadGif(name: "animatedSquare")
            playSound(soundName: "Square")
        }
        else {
            imageView.loadGif(name: "animatedOval")
            playSound(soundName: "Oval")
        }
        
        //MARK:- Image Constraints
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    deinit {
        print("Shapes deinitialized")
    }
}
