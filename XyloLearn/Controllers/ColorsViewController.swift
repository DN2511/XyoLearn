

import UIKit

class ColorsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func colorPressed(_ sender: UIButton) {
        
        // UIAlert View
             
             let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
             self.present(alert, animated: true, completion: {
             alert.view.superview?.isUserInteractionEnabled = true
             alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTap)))
             })

             let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
             subview.layer.cornerRadius = 1
             
                   
             if sender.currentTitle == "RED" {
                 subview.backgroundColor = UIColor.systemRed
             }
             else if sender.currentTitle == "ORANGE" {
                 subview.backgroundColor = UIColor.systemOrange
             }
             else if sender.currentTitle == "YELLOW" {
                 subview.backgroundColor = UIColor.systemYellow
             }
             else if sender.currentTitle == "GREEN" {
                 subview.backgroundColor = UIColor.systemGreen
             }
             else if sender.currentTitle == "PINK" {
                 subview.backgroundColor = UIColor.systemPink
             }
             else if sender.currentTitle == "BLUE" {
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

