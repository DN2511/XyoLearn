

import Foundation
import UIKit
//import ImageIO
//import AVFoundation

class FruitsViewController: UIViewController {
    
//    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Home Button function
    
    @IBAction func homePressed(_ sender: UIButton) {
        
        let hVC = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomePageViewController
        
        self.navigationController?.pushViewController(hVC, animated: false)
    }
    
    //MARK:- Button for Fruits & Custom Alert Initialization
    
    @IBAction func fruitPressed(_ sender: UIButton) {
        
        let customAlert = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "popUpID") as! PopUpViewController
        
        customAlert.modalPresentationStyle = UIModalPresentationStyle.custom
        
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        self.present(customAlert, animated: true, completion:{
        customAlert.view.superview?.isUserInteractionEnabled = true
            customAlert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTap)))
        })
        //MARK:- Loop For Different mp4
        
        if sender.currentTitle == "1" {
            customAlert.playVideo(videoName: "Banana")
        }
        else if sender.currentTitle == "2" {
            customAlert.playVideo(videoName: "Strawberry")
        }
        else if sender.currentTitle == "3" {
            customAlert.playVideo(videoName: "Pear")
        }
        else if sender.currentTitle == "4" {
            customAlert.playVideo(videoName: "Orange")
        }
        else if sender.currentTitle == "5" {
            customAlert.playVideo(videoName: "Kiwi")
        }
        else if sender.currentTitle == "6" {
            customAlert.playVideo(videoName: "Grape")
        }
        else {
            customAlert.playVideo(videoName: "Apple")
        }
    }
}
