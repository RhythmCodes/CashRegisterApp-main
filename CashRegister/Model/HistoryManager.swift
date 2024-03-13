

import Foundation

class HistoryManager {
    
    var historyItems = [History]()
    
    func addPurchaseHistory(product : Item, newQty:Int) {
        var histItem = History(histName:product.itemName, histQty:newQty, histCost:(product.itemPrice * Double(newQty)))
        historyItems.append(histItem)
    }
    
    func getHistory() -> [History]{
        return historyItems
    }
}
