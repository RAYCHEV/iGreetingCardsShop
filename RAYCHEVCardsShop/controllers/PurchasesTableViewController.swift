//
//  PurchasesTableViewController.swift
//  RAYCHEVCardsShop
//
//  Created by Nikolay Raychev on 24.06.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import UIKit

class PurchasesTableViewController: UITableViewController {
    var purchases : [Purchase] = [Purchase]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        purchases = PurchaseDataManager.purchases
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return purchases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchasesTableCellIdentifier", for: indexPath) as! PurchasesTableViewCell

        cell.recipientNameUILabel.text = purchases[indexPath.row].recipientName
        cell.dateUILabel.text = purchases[indexPath.row].date.description

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
       guard let segueIndentifier = segue.identifier else {
            return
        }
            switch segueIndentifier {
            case "showDetailsIdentifier":
                
                let nextScene =  segue.destination as! PurchaseDetailViewController
                
                        // Pass the selected object to the new view controller.
                        if let indexPath = self.tableView.indexPathForSelectedRow {
                            let selectedPurchase = purchases[indexPath.row]
                            nextScene.currentPurchase = selectedPurchase
                        }
            default:
                break
        }
    }
}
