

import Foundation
import UIKit
import ImageIO

class VegetablesViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func vegetablePressed(_ sender: UIButton) {
        
        // UIAlert View
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        self.present(alert, animated: true, completion: {
            alert.view.superview?.isUserInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTap)))
        })
        
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.layer.cornerRadius = 1
        
        let imageview = UIImageView(frame: CGRect(x: 50, y:80, width: 200, height: 200))
        
        alert.view.addSubview(imageview)
        
        
        if sender.currentTitle == "Broccoli" {
            imageview.loadGif(name: "animatedBroccoli")
        }
        else if sender.currentTitle == "Carrot" {
            imageview.loadGif(name: "animatedCarrot")
        }
        else if sender.currentTitle == "Egg Plant" {
            imageview.loadGif(name: "")
        }
        else if sender.currentTitle == "Pumpkin" {
            subview.backgroundColor = UIColor.systemGreen
        }
        else if sender.currentTitle == "Mushroom" {
            subview.backgroundColor = UIColor.systemPink
        }
        else if sender.currentTitle == "Potato" {
            subview.backgroundColor = UIColor.systemBlue
        }
        else {
            subview.backgroundColor = UIColor.systemPurple
        }
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.height * 0.50)
        
        alert.view.addConstraint(height)
        
        // Calling the Blur Function from Extension File -- This will Blur the background
        self.view.blurredEffect()
        
        // This Will keep the UIAlert View for 3 seconds
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when){
            
            // This will dismiss the alert
            alert.dismiss(animated: true, completion: nil)
            
            // Calling the function from Extension file to dismiss Blur
            self.view.dismissBlurredEffect()
            
        }
    }
}
