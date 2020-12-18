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
        
        let xVC = self.storyboard?.instantiateViewController(withIdentifier: "xyloVC") as! xyloViewController

               self.navigationController?.pushViewController(xVC, animated: false)
    }
    
    
    @IBAction func fruitsButtonPressed(_ sender: UIButton) {
        
        let fVC = self.storyboard?.instantiateViewController(withIdentifier: "fruitVC") as! FruitsViewController

               self.navigationController?.pushViewController(fVC, animated: false)
    }
    
    
    @IBAction func vegesButtonPressed(_ sender: UIButton) {
        
        let vVC = self.storyboard?.instantiateViewController(withIdentifier: "vegetableVC") as! VegetablesViewController
               
               self.navigationController?.pushViewController(vVC, animated: false)
    }
    
    @IBAction func shapesButtonPressed(_ sender: UIButton) {
        
        let sVC = self.storyboard?.instantiateViewController(withIdentifier: "shapesVC") as! ShapesViewController
               
               self.navigationController?.pushViewController(sVC, animated: false)
        
    }
    
    @IBAction func numbersButtonPressed(_ sender: UIButton) {
        
        let nVC = self.storyboard?.instantiateViewController(withIdentifier: "numbersVC") as! NumbersViewController
               
               self.navigationController?.pushViewController(nVC, animated: false)
        
    }
}
