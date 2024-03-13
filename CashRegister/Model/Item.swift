
import Foundation

class Item {
    var itemName: String
    var itemQty: Int
    var itemPrice: Double
    
    init(iName:String,iQty:Int, iCost:Double) {
        itemName = iName
        itemQty = iQty
        itemPrice = iCost
    }
}
