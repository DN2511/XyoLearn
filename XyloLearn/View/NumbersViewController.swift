

import Foundation
import UIKit
//import ImageIO

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
        
        customAlert.modalPresentationStyle = UIModalPresentationStyle.custom
        
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        self.present(customAlert, animated: true, completion:{
        customAlert.view.superview?.isUserInteractionEnabled = true
            customAlert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTap)))
        })
        //MARK:- Loop For Different mp4
        
        if sender.currentTitle == "1" {
            customAlert.playVideo(videoName: "1")
        }
        else if sender.currentTitle == "2" {
            customAlert.playVideo(videoName: "2")
        }
        else if sender.currentTitle == "3" {
            customAlert.playVideo(videoName: "3")
        }
        else if sender.currentTitle == "4" {
            customAlert.playVideo(videoName: "4")
        }
        else if sender.currentTitle == "5" {
            customAlert.playVideo(videoName: "5")
        }
        else if sender.currentTitle == "6" {
            customAlert.playVideo(videoName: "6")
        }
        else {
            customAlert.playVideo(videoName: "7")
        }
    }
}
