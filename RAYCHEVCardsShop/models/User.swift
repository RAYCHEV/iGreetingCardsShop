//
//  User.swift
//  RAYCHEVCardsShop
//
//  Created by Nikolay Raychev on 24.06.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

struct User {
    static var name: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "userName")
        }
        get{
            return UserDefaults.standard.string(forKey: "userName") ?? ""
        }
    }
    
    static var email: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "userEmail")
        }
        get {
            return UserDefaults.standard.string(forKey: "userEmail") ?? ""
        }
    }
    
    static var phone: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "userPhone")
        }
        get {
            return UserDefaults.standard.string(forKey: "userPhone") ?? ""
        }
    }
}
