//
//  ViewController.swift
//  CashRegisterApp
//
//  Created by user23804 on 2/27/24.
//
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var selectedItemLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var itemTableView: UITableView!
    
    
    var storageString : String = ""
    var selectedRow : Int?
    
    var itemManager : ItemManager = ItemManager()
    var historyManager : HistoryManager = HistoryManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        selectedItemLabel.text = ""
        resetFields()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemManager.getItems().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customTableViewCell
        
        cell.productName?.text = itemManager.getItems()[indexPath.row].itemName
        
        let qty = itemManager.getItems()[indexPath.row].itemQty ?? 0;
        cell.productQty?.text = "\(qty)"
        
        let price = itemManager.getItems()[indexPath.row].itemPrice ?? 0;
        cell.productPrice?.text = "\(price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        resetFields()
        selectedItemLabel.isHidden = false
        selectedItemLabel.text = itemManager.getItems()[indexPath.row].itemName
        selectedRow = indexPath.row
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let managerVC = segue.destination as? ManagerViewController
        managerVC!.itemManager = itemManager
        managerVC!.historyManager = historyManager
    }
    
    func resetFields() {
        quantityLabel.isHidden = true;
        quantityLabel.text = ""
        storageString = ""
        priceLabel.isHidden = true
        priceLabel.text = ""
    }
    
    
    
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Error!!", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { action in
                self.resetFields()
            }
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }

    @IBAction func qtySelected(_ sender: Any) {
        if let btnTitle = (sender as! UIButton).currentTitle {
            guard let selectedRow = selectedRow else {
                // No cell selected, show alert
                showAlert(message: "Select an item first")
                return
            }
            
            if let btnTitle = (sender as! UIButton).currentTitle {
                storageString.append(btnTitle)
            }
            
            quantityLabel.isHidden = false
            quantityLabel.text = storageString
            
            let itemPrice = itemManager.getItems()[selectedRow].itemPrice * Double(storageString)!;
            priceLabel.isHidden = false
            priceLabel.text = "\(itemPrice)"
            
            if let number = Int(storageString) {
                if number > itemManager.getItems()[selectedRow].itemQty {
                    showAlert(message: "Selected itemQty cannot be more than quantity in stock.")
                }
            }
        }
    }

    
    @IBAction func buyProduct(_ sender: Any) {
        if (selectedRow != nil) { 
                        itemManager.getItems()[selectedRow!].itemQty -= Int(storageString)!
                        historyManager.addPurchaseHistory(product: itemManager.getItems()[selectedRow!], newQty:Int(storageString)!)
                        itemTableView.reloadData()
        }
    }
    
   

}

