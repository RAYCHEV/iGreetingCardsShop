//
//  PurchaseDetailViewController.swift
//  RAYCHEVCardsShop
//
//  Created by Nikolay Raychev on 24.06.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import UIKit

class PurchaseDetailViewController: UIViewController {
    
    var currentPurchase: Purchase?
    
    
    @IBOutlet weak var recipientNameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var favoriteColorLabel: UILabel!
    @IBOutlet weak var wishesLabel: UILabel!
    @IBOutlet weak var sendersLabel: UILabel!
    @IBOutlet weak var luxaryLevelLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipientNameLabel.text = self.currentPurchase?.recipientName
        self.genderLabel.text = self.currentPurchase?.gender
        self.favoriteColorLabel.text = self.currentPurchase?.favoriteColor
        self.wishesLabel.text = self.currentPurchase?.wishes
        self.sendersLabel.text = self.currentPurchase?.senders
        self.luxaryLevelLabel.text = self.currentPurchase?.senders
        self.dataLabel.text = self.currentPurchase?.date.description
        self.priceLabel.text = self.currentPurchase?.price.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
