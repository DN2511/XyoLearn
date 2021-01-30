//
//  HomePageViewCoontroller.swift
//  XyloLearn
//
//  Created by Deepanshu Nautiyal on 14/1/21.
//  Copyright © 2021 Deepanshu Nautiyal. All rights reserved.
//

import Foundation
import UIKit

class HomePageViewController: UIViewController{
    
    override func viewDidAppear(_ animated: Bool) {
        playSound(soundName: "backgroundMusic")
    }
    
    @IBAction func fBP(_ sender: UIButton) {
        let fVC = self.storyboard?.instantiateViewController(withIdentifier: "fruitVC") as! FruitsViewController

               self.navigationController?.pushViewController(fVC, animated: false)
    }
    
    @IBAction func vBP(_ sender: UIButton) {
        let vVC = self.storyboard?.instantiateViewController(withIdentifier: "vegetableVC") as! VegetablesViewController

               self.navigationController?.pushViewController(vVC, animated: false)
    }
    
    @IBAction func cBP(_ sender: UIButton) {
        let cVC = self.storyboard?.instantiateViewController(withIdentifier: "colourVC") as! ColorsViewController

               self.navigationController?.pushViewController(cVC, animated: false)
    }
    
    
    @IBAction func xBP(_ sender: UIButton) {
        let xVC = self.storyboard?.instantiateViewController(withIdentifier: "xyloVC") as! xyloViewController

               self.navigationController?.pushViewController(xVC, animated: false)
    }
    
    @IBAction func iBP(_ sender: UIButton) {

        let customAlert = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "instructionsVC") as! instructionsViewController
        self.present(customAlert, animated: true, completion:{
        customAlert.view.superview?.isUserInteractionEnabled = true
        customAlert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTap)))
        })
  }
    
    
    @IBAction func nBP(_ sender: UIButton) {
        let nVC = self.storyboard?.instantiateViewController(withIdentifier: "numbersVC") as! NumbersViewController

               self.navigationController?.pushViewController(nVC, animated: false)
    }
    
    @IBAction func aBP(_ sender: UIButton) {
        let aVC = self.storyboard?.instantiateViewController(withIdentifier: "animalVC") as! AnimalsViewController

               self.navigationController?.pushViewController(aVC, animated: false)
    }
    
    @IBAction func sBP(_ sender: UIButton) {
        let sVC = self.storyboard?.instantiateViewController(withIdentifier: "shapesVC") as! ShapesViewController

               self.navigationController?.pushViewController(sVC, animated: false)
    }
    
}
