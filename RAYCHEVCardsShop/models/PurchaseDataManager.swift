
//
//  PurchaseDataManager.swift
//  RAYCHEVCardsShop
//
//  Created by Nikolay Raychev on 24.06.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

class PurchaseDataManager {
    static var purchases: [Purchase] = [Purchase]()
//    static var userName:String = "Ivancho"
    
    class func submitPurchase(newPurchase: Purchase){
        
        purchases.append(newPurchase)
        PurchaseRequestManager.addPurchase(purchase: newPurchase){
            (errorMessage) in
            DispatchQueue.main.async {
                guard errorMessage == nil else {
                    //TODO: - show error message
                    return
                }
                //TODO: - show sucsses
            }
        }
        
    }
}
