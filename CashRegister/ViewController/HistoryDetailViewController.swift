
import UIKit

class HistoryDetailViewController: UIViewController {

    @IBOutlet weak var iName: UILabel!
    @IBOutlet weak var iQty: UILabel!
    @IBOutlet weak var iDate: UILabel!
    @IBOutlet weak var iTotalPrice: UILabel!
    
    var history : History?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iName.text = history?.name
        
        let qty = history?.quantity ?? 0
        iQty.text = "\(qty)"
        iDate.text = history?.purchaseDate
        
        let totalPrice = history?.totalCost ?? 0
        iTotalPrice.text = "Total Price of item : \(totalPrice)"
        
    }
}
