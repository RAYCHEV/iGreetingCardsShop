//
//  IsValid.swift
//  RAYCHEVCardsShop
//
//  Created by Nikolay Raychev on 24.06.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

class IsValid {
    
    class func email(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    class func compareTheEmailFiels(_ email: String, _ confirmEmail: String) -> Bool {
        if email == confirmEmail && !confirmEmail.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    class func userName(_ name: String) -> Bool {
        if name.count >= 3 {
            return true
        } else {
            return false
        }
    }
    
    class func phoneNumber(_ phoneNum: String) -> Bool {
        //        let phoneRegEx = "^(\\(\\d{3}\\)|\\d{3})-?\\d{3}-?\\d{4}$"
        //        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        //        return  phoneTest.evaluate(with: phoneNum)
        if phoneNum.count > 6 {
            return true
        } else {
            return false
        }
    }
}
