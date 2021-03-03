//
//  IAPManager.swift
//  XyloLearn
//
//  Created by Deepanshu Nautiyal on 1/3/21.
//  Copyright © 2021 Deepanshu Nautiyal. All rights reserved.
//

//import Foundation
//import StoreKit

//class IAPManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
//    static let shared = IAPManager()
//
//    private var products = [SKProduct]()
//
//    private var productBeingPurchased: SKProduct?
//
//    enum Product: String, CaseIterable {
//             case numbersProductID = "com.bubbapedia.xylolearn1.Paisa6"
//             case shapesProductID   = "com.bubbapedia.xylolearn1.Paisa5"
//    }
//
//    // Fetch Product Objects form Apple
//
//    public func fetchProducts(){
//        let request = SKProductsRequest(productIdentifiers: Set(Product.allCases.compactMap({ $0.rawValue })))
//        request.delegate = self
//        request.start()
//    }
//
//    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
//         products = response.products
//        guard let product = products.first else {
//            return
//        }
//        purchase(product: product)
//}
//
//    func request(_ request: SKRequest, didFailWithError error: Error) {
//        guard request is SKProductsRequest else {
//            return
//        }
//        print("Product fetch request failes!")
//    }
//
//
//    // Prompt a product payment transaction
//
//    public func purchase(product: SKProduct) {
//        guard SKPaymentQueue.canMakePayments() else {
//            return
//        }
//        productBeingPurchased = product
//        let payment = SKPayment(product: product)
//        SKPaymentQueue.default().add(self)
//        SKPaymentQueue.default().add(payment)
//    }
//
//
//    // Observe the transaction state
//
//    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
//        transactions.forEach({ transaction in
//            switch transaction.transactionState {
//            case .purchasing:
//                 break
//            case .purchased:
//                handlePurchase(transaction.payment.productIdentifier)
//                 break
//            case .restored:
//                break
//            case .deferred:
//               break
//            case .failed:
//              break
//            @unknown default:
//                break
//            }
//        })
//    }
//
//    private func handlePurchase(_ id: String){
//
//    }
//}


//mark:- Different Method

import UIKit
import StoreKit

enum IAPHandlerAlertType{
    case disabled
    case restored
    case purchased

    func message() -> String{
        switch self {
        case .disabled: return "Purchases are disabled in your device!"
        case .restored: return "You've successfully restored your purchase!"
        case .purchased: return "You've successfully bought this purchase!"
        }
    }
}


class IAPHandler: NSObject {
    static let shared = IAPHandler()

    let numberProductID = "com.bubbapedia.xylolearn1.Paisa6"
    let shapesProductID = "com.bubbapedia.xylolearn1.Paisa7"

    fileprivate var productID = ""
    fileprivate var productsRequest = SKProductsRequest()
    fileprivate var iapProducts = [SKProduct]()

    var purchaseStatusBlock: ((IAPHandlerAlertType) -> Void)?

    // MARK: - MAKE PURCHASE OF A PRODUCT
    func canMakePurchases() -> Bool {  return SKPaymentQueue.canMakePayments()  }

    func purchaseMyProduct(index: Int){
        if iapProducts.count == 0 { return }

        if self.canMakePurchases() {
            let product = iapProducts[index]
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)

            print("PRODUCT TO PURCHASE: \(product.productIdentifier)")
            productID = product.productIdentifier
        } else {
            purchaseStatusBlock?(.disabled)
        }
    }

    // MARK: - RESTORE PURCHASE
    func restorePurchase(){
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }


    // MARK: - FETCH AVAILABLE IAP PRODUCTS
    func fetchAvailableProducts(){

        // Put here your IAP Products ID's
        let productIdentifiers = NSSet(objects: numberProductID,shapesProductID
        )

        productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers as! Set<String>)
        productsRequest.delegate = self
        productsRequest.start()
    }
}

extension IAPHandler: SKProductsRequestDelegate, SKPaymentTransactionObserver{
    // MARK: - REQUEST IAP PRODUCTS
    func productsRequest (_ request:SKProductsRequest, didReceive response:SKProductsResponse) {

        if (response.products.count > 0) {
            iapProducts = response.products
            for product in iapProducts{
                let numberFormatter = NumberFormatter()
                numberFormatter.formatterBehavior = .behavior10_4
                numberFormatter.numberStyle = .currency
                numberFormatter.locale = product.priceLocale
                let price1Str = numberFormatter.string(from: product.price)
                print(product.localizedDescription + "\nfor just \(price1Str!)")
            }
        }
    }

    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        purchaseStatusBlock?(.restored)
    }

    // MARK:- IAP PAYMENT QUEUE
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction:AnyObject in transactions {
            if let trans = transaction as? SKPaymentTransaction {
                switch trans.transactionState {
                case .purchased:
                    print("purchased")
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    purchaseStatusBlock?(.purchased)
                    break

                case .failed:
                    print("failed")
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    break
                case .restored:
                    print("restored")
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    break

                default: break
                }}}
    }
}
