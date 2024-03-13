

import Foundation


class ItemManager {

    var items = [
        Item(iName: "Casual Shoes", iQty: 60, iCost:  75),
        Item(iName: "Running shoes", iQty: 100, iCost:  120),
        Item(iName: "Stylish shoes", iQty: 50, iCost:  300),
        Item(iName: "Slides", iQty: 60, iCost:  45),
        Item(iName: "Sandals", iQty: 50, iCost:  45),
    ]
    
    func getItems() -> [Item] {
        return items
    }
}
