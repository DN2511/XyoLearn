

import Foundation
import UIKit
import ImageIO

class NumbersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Home Button function
    
    @IBAction func homePressed(_ sender: UIButton) {
        
        let hVC = self.storyboard?.instantiateViewController(withIdentifier: "Home")as! HomePageViewController
        
        self.navigationController?.pushViewController(hVC, animated: false)
    }
    
    //MARK:- Button for Numbers & Custom Alert Initialization
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
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
            imageView.loadGif(name: "1")
            playSound(soundName: "One")
        }
        else if sender.currentTitle == "2" {
            imageView.loadGif(name: "2")
            playSound(soundName: "Two")
        }
        else if sender.currentTitle == "3" {
            imageView.loadGif(name: "3")
            playSound(soundName: "Three")
        }
        else if sender.currentTitle == "4" {
            imageView.loadGif(name: "4")
            playSound(soundName: "Four")
        }
        else if sender.currentTitle == "5" {
            imageView.loadGif(name: "5")
            playSound(soundName: "Five")
        }
        else if sender.currentTitle == "6" {
            imageView.loadGif(name: "6")
            playSound(soundName: "Six")
        }
        else {
            imageView.loadGif(name: "7")
            playSound(soundName: "Seven")
        }
        
        //MARK:- Image Constraints
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
