

import Foundation
import UIKit
//import ImageIO
//import AVFoundation
//import StoreKit

class ShapesViewController: UIViewController{
    
//    unowned var player: AVAudioPlayer!
    
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
        
        customAlert.modalPresentationStyle = UIModalPresentationStyle.custom
        
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        self.present(customAlert, animated: true, completion:{
            customAlert.view.superview?.isUserInteractionEnabled = true
            customAlert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTap)))
        })
        //MARK:- Loop For Different mp4
        
        if sender.currentTitle == "1" {
            customAlert.playVideo(videoName: "Rectangle")
        }
        else if sender.currentTitle == "2" {
            customAlert.playVideo(videoName: "Circle")
        }
        else if sender.currentTitle == "3" {
            customAlert.playVideo(videoName: "Triangle")
        }
        else if sender.currentTitle == "4" {
            customAlert.playVideo(videoName: "Heart")
        }
        else if sender.currentTitle == "5" {
            customAlert.playVideo(videoName: "Star")
        }
        else if sender.currentTitle == "6" {
            customAlert.playVideo(videoName: "Square")
        }
        else {
            customAlert.playVideo(videoName: "Oval")
        }
    }
}

