
import UIKit

class RestockViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var stockTableView: UITableView!
    @IBOutlet weak var newQuantity: UITextField!
    var itemManager : ItemManager?
    var selectedRow : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemManager!.getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "restockCell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = itemManager!.getItems()[indexPath.row].itemName
        let qty = itemManager!.getItems()[indexPath.row].itemQty ?? 0;
        cell.detailTextLabel?.text = "\(qty)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
    }
    
    @IBAction func addRestock(_ sender: Any) {
        if let newQty = newQuantity.text {
            


            if (selectedRow == nil || newQty.isEmpty) {
                var alert = UIAlertController(title: "Error!!", message: "You need to select an item first", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
            else {
                itemManager!.getItems()[selectedRow!].itemQty += Int(newQty)!
                stockTableView.reloadData()
                newQuantity.text = ""
            }
        }
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
   
    

 


    
}
