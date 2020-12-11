

import Foundation
import UIKit
import ImageIO
import AVFoundation

class ColorsViewController: UIViewController {
    
    var player:AVAudioPlayer!

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
    
    //MARK:- Button for Colors & Alert Initialization
    
    @IBAction func colorPressed(_ sender: UIButton) {
        
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
            imageView.loadGif(name: "redheart")
        }
        else if sender.currentTitle == "2" {
            imageView.loadGif(name: "orange")
        }
        else if sender.currentTitle == "3" {
            imageView.loadGif(name: "blue")
            playSound(soundName: "Blue")
        }
        else if sender.currentTitle == "4" {
            imageView.loadGif(name: "green")
            playSound(soundName: "Green1")
        }
        else if sender.currentTitle == "5" {
            imageView.loadGif(name: "purple")
        }
        else if sender.currentTitle == "6" {
            imageView.loadGif(name: "yellow")
        }
        else {
            imageView.loadGif(name: "pink")
        }
        
        //MARK:- Image Constraints
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}

