//
//  RegisterViewController.swift
//  RAYCHEVCardsShop
//
//  Created by Nikolay Raychev on 24.06.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userConfirmEmail: UITextField!
    @IBOutlet weak var userPhoneTextField: UITextField!
    
    private var isValid: [UITextField:Bool] = [UITextField:Bool]()
    private var validCurrentEmail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        userEmailTextField.delegate = self
        userConfirmEmail.delegate = self
        userPhoneTextField.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        guard User.name == "" else {
        self.performSegue(withIdentifier: "showPurchaseTableUserDef", sender: nil)
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            userPhoneTextField.becomeFirstResponder()
        case userPhoneTextField:
            userEmailTextField.becomeFirstResponder()
        case userEmailTextField:
            userConfirmEmail.becomeFirstResponder()
        case userConfirmEmail:
            userConfirmEmail.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentTextFieldText = textField.text else {
            return false
        }
        let nextTextFieldText = NSString(string: currentTextFieldText).replacingCharacters(in: range, with: string)
        
        switch textField {
        case userEmailTextField:
            isValid[textField] = IsValid.email(nextTextFieldText)
            guard IsValid.email(nextTextFieldText) else {
                return true
            }
            validCurrentEmail = nextTextFieldText
        case userConfirmEmail:
            isValid[textField] = IsValid.compareTheEmailFiels(self.validCurrentEmail, nextTextFieldText)
        case userNameTextField:
            isValid[textField] = IsValid.userName(nextTextFieldText)
        case userPhoneTextField:
            isValid[textField] = IsValid.phoneNumber(nextTextFieldText)
        default:
            isValid[textField] = false
        }
        
        if isValid[textField] ?? false {
            textField.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        } else {
            textField.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        }
        return true
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
//        //is everything valid
        var isValidCount: Int = 0
        for item in isValid {
            if item.value {
                isValidCount += 1
            }
        }
        // 4 cheks
        guard isValidCount == 4 else {
            return
        }
        User.name = userNameTextField.text!
        User.email = userEmailTextField.text!
        User.phone = userPhoneTextField.text!
        
        UserRequestManager.addUser(userEmail: User.email, userName: User.name, userPhone: User.phone){
        (errorMessage) in
            DispatchQueue.main.async {
                guard errorMessage == nil else {
                    //FIXME:- show errorMessage
                    print(errorMessage?.description ?? "not working")
                    return
                }
            }
        }
        //FIXME: - show success
        print("success :))))")
        self.performSegue(withIdentifier: "showPurchaseTable", sender: nil)
    }
}
