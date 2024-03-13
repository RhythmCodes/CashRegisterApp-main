import UIKit

class ManagerViewController: UIViewController {
    
    var itemManager : ItemManager?
    var historyManager : HistoryManager?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "restockSegue") {
            let restockVC = segue.destination as? RestockViewController
            restockVC!.itemManager = itemManager
        } 
        else if (segue.identifier == "historySegue") {
            let historyVC = segue.destination as? HistoryTableViewController
            historyVC!.historyManager = historyManager
        }
    }
}
