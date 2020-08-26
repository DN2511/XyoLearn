//
//  MainPageVieController.swift
//  XyloLearn
//
//  Created by Deepanshu Nautiyal on 31/7/20.
//  Copyright © 2020 Deepanshu Nautiyal. All rights reserved.
//

import Foundation
import UIKit

class HomePageViewController: UIViewController {
    
 
    @IBAction func colourButtonPressed(_ sender: UIButton) {
        
        let cVC = self.storyboard?.instantiateViewController(withIdentifier: "colourVC") as! ColorsViewController
        
        self.navigationController?.pushViewController(cVC, animated: false)
    }
    
    @IBAction func animalButtonPressed(_ sender: UIButton) {
        
        let aVC = self.storyboard?.instantiateViewController(withIdentifier: "animalVC") as! AnimalsViewController
               
               self.navigationController?.pushViewController(aVC, animated: false)
    }
    
    @IBAction func xyloButtonPressed(_ sender: UIButton) {
        
//        let colorVC = self.storyboard?.instantiateViewController(withIdentifier: "colourVC") as! ColorsViewController
//
//               self.navigationController?.pushViewController(colorVC, animated: false)
    }
    
    
    @IBAction func fruitsButtonPressed(_ sender: UIButton) {
        
        let fVC = self.storyboard?.instantiateViewController(withIdentifier: "fruitVC") as! FruitsViewController

               self.navigationController?.pushViewController(fVC, animated: false)
    }
    
    
    @IBAction func vegesButtonPressed(_ sender: UIButton) {
        
        let vVC = self.storyboard?.instantiateViewController(withIdentifier: "vegetableVC") as! VegetablesViewController
               
               self.navigationController?.pushViewController(vVC, animated: false)
    }
    
    
}
