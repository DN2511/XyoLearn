

import Foundation
import UIKit
import ImageIO

class ColorsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- Home Button function
    
    @IBAction func homePressed(_ sender: UIButton) {
        
        let hVC = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomePageViewController
        
        self.navigationController?.pushViewController(hVC, animated: false)
    }
    
    //MARK:- Button for Colors & Alert Initialization
    
    @IBAction func colorPressed(_ sender: UIButton) {
        
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
            imageView.loadGif(name: "redheart")
        }
        else if sender.currentTitle == "2" {
            imageView.loadGif(name: "orange")
        }
        else if sender.currentTitle == "3" {
            imageView.loadGif(name: "blue")
        }
        else if sender.currentTitle == "4" {
            imageView.loadGif(name: "green")
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

