//
//  HomePageViewCoontroller.swift
//  XyloLearn
//
//  Created by Deepanshu Nautiyal on 14/1/21.
//  Copyright © 2021 Deepanshu Nautiyal. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class HomePageViewController: UIViewController, SKPaymentTransactionObserver{

    let productID = "com.bubbapedia.xylolearn1.Paisa7"
    
    override func viewDidAppear(_ animated: Bool) {
        playSoundOnLoop(soundName: "Background")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SKPaymentQueue.default().add(self)
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
        
        //        let aVC = self.storyboard?.instantiateViewController(withIdentifier: "animalVC") as! AnimalsViewController
        //
        //        self.navigationController?.pushViewController(aVC, animated: false)
        
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    @IBAction func sBP(_ sender: UIButton?) {
        
        if isPurchased() {
           return showVC()
        } else {
            return buyVC()
        }
    }
    
    // MARK: In App Purchase Methods
    
    func buyVC() {
        if SKPaymentQueue.canMakePayments() {
            // Can Make Payment
            
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID
            SKPaymentQueue.default().add(paymentRequest)
            
        } else {
            // Can't Make Payments
            print("User can't make payments")
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            if transaction.transactionState == .purchased {
                
                // User Payment Successful
                
                print("Transaction Successful")
                showVC()
                
                SKPaymentQueue.default().finishTransaction(transaction)
                
            } else if transaction.transactionState == .failed {
                
                // User Payment Failed
                
                if let error = transaction.error {
                    let errorDescription = error.localizedDescription
                    print("Transaction Failed due to error: \(errorDescription)")
                }
                
                SKPaymentQueue.default().finishTransaction(transaction)
                
            } else if transaction.transactionState == .restored {
                
                // Restore Successful
                
                print("Restore Successful")
                showVC()
                
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
    }
    
    func showVC() {
        
        UserDefaults.standard.set(true, forKey: productID)
        
        let sVC = self.storyboard?.instantiateViewController(withIdentifier: "shapesVC") as! ShapesViewController
        
        self.navigationController?.pushViewController(sVC, animated: false)
    }
    
    func isPurchased() -> Bool  {
        let purchaseStatus = UserDefaults.standard.bool(forKey: productID)
        
        if purchaseStatus {
            print("Previously Purchased")
            return true
        } else {
            print("Never Purchased")
            return false
        }
    }
}

