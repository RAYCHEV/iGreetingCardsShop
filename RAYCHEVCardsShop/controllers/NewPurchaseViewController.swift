//
//  NewPurchaseViewController.swift
//  RAYCHEVCardsShop
//
//  Created by Nikolay Raychev on 24.06.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import UIKit

class NewPurchaseViewController: UIViewController {
    @IBOutlet weak var purRecipientNameTextField: UITextField!
    @IBOutlet weak var purGenderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var purFavoriteColorTextField: UITextField!
    @IBOutlet weak var purWishesTextField: UITextField!
    @IBOutlet weak var purSendersTextField: UITextField!
    @IBOutlet weak var purDataTextField: UITextField!
    @IBOutlet weak var purPriceTextField: UITextField!
    @IBOutlet weak var purLyxaryLevelSlider: UISlider!
    
    private var newPurcharse: Purchase?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calcPrice() {
        
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        newPurcharse = Purchase(recipientName: self.purRecipientNameTextField.text!, gender: "F", favoriteColor: self.purFavoriteColorTextField.text!, wishes: self.purWishesTextField.text!, senders: self.purSendersTextField.text!, luxaryLevel: 10, date: Double(Date().timeIntervalSinceReferenceDate), price: 12.0)
        
            PurchaseDataManager.submitPurchase(newPurchase: newPurcharse!)
        self.navigationController?.popViewController(animated: true)
    }
}
