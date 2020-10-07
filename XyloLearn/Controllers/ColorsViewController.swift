

import UIKit

class ColorsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func homePressed(_ sender: UIButton) {
        
        let hVC = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomePageViewController
        
        self.navigationController?.pushViewController(hVC, animated: false)
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        
        //MARK:- Custom Alert Initialization
        
        let customAlert = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "popUpID") as! PopUpViewController
        
        self.addChild(customAlert)
        customAlert.view.frame = self.view.frame
        self.view.addSubview(customAlert.view)
        customAlert.didMove(toParent: self)
             
//             let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
//             self.present(alert, animated: true, completion: {
//             alert.view.superview?.isUserInteractionEnabled = true
//             alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTap)))
//             })
//
//             let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
//             subview.layer.cornerRadius = 1
             
                   
             if sender.currentTitle == "1" {
                view.backgroundColor = UIColor.systemRed
             }
             else if sender.currentTitle == "2" {
                 view.backgroundColor = UIColor.systemOrange
             }
             else if sender.currentTitle == "3" {
                 view.backgroundColor = UIColor.systemBlue
             }
             else if sender.currentTitle == "4" {
                 view.backgroundColor = UIColor.systemGreen
             }
             else if sender.currentTitle == "5" {
                 view.backgroundColor = UIColor.systemPurple
             }
             else if sender.currentTitle == "6" {
                view.backgroundColor = UIColor.systemYellow
             }
             else {
                view.backgroundColor = UIColor.systemPink
             }
        
        //MARK:- Image Constraints
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: customAlert.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
             
//             let height:NSLayoutConstraint = NSLayoutConstraint(item: customAlert.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.height * 0.50)
//
//             customAlert.view.addConstraint(height)
             
//             // Calling the Blur Function from Extension File -- This will Blur the background
//             self.view.blurredEffect()
//
//             // This Will keep the UIAlert View for 3 seconds
//             let when = DispatchTime.now() + 3
//             DispatchQueue.main.asyncAfter(deadline: when){
//
//                 // This will dismiss the alert
//                 alert.dismiss(animated: true, completion: nil)
//
//                 // Calling the function from Extension file to dismiss Blur
//                 self.view.dismissBlurredEffect()
//
//             }
    }
    

}

