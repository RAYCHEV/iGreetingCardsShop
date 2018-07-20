//
//  UserRequestManager.swift
//  RAYCHEVCardsShop
//
//  Created by Nikolay Raychev on 24.06.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

class UserRequestManager {
    class func addUser(userEmail: String, userName: String, userPhone: String, completion: @escaping (_ errorMessage: String?)->()) {
        
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        

        guard let URL = URL(string: "https://myFirebase.firebaseio.com/users/\(userName)\(userPhone).json") else {return}
        
        var request = URLRequest(url: URL)
        request.httpMethod = "PUT"
        
        // Headers
        
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        // JSON Body
        
        let bodyObject: [String : Any] = [
            "email": userEmail,
            "phone": userPhone,
            "name": userName
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                completion(nil)
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                completion(error!.localizedDescription)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
