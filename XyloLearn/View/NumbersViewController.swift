

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
            imageView.loadGif(name: "animated1")
        }
        else if sender.currentTitle == "2" {
            imageView.loadGif(name: "animated2")
        }
        else if sender.currentTitle == "3" {
            imageView.loadGif(name: "animated3")
        }
        else if sender.currentTitle == "4" {
            imageView.loadGif(name: "animated4")
        }
        else if sender.currentTitle == "5" {
            imageView.loadGif(name: "animated5")
        }
        else if sender.currentTitle == "6" {
            imageView.loadGif(name: "animated6")
        }
        else {
            imageView.loadGif(name: "animated7")
        }
        
        //MARK:- Image Constraints
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
