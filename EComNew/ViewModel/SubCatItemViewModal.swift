//
//  SubCatItemViewModal.swift
//  EComNew
//
//  Created by Way2 on 04/07/24.
//

import Foundation

class SubCatItemViewModal {
    
    var subCatItems: [SubCatItems] = []
    
    init() {
          loadShopItems()
    }
      
    func loadShopItems() {
          subCatItems = [
          
            SubCatItems(subCatName: "Tops"),
            SubCatItems(subCatName: "Shirts & Blouses"),
            SubCatItems(subCatName: "Cardigans & Sweaters"),
            SubCatItems(subCatName: "Knitwear"),
            SubCatItems(subCatName: "Blazer"),
            SubCatItems(subCatName: "Outwear"),
            SubCatItems(subCatName: "Pants"),
            SubCatItems(subCatName: "Jeans"),
            SubCatItems(subCatName: "Shorts"),
            SubCatItems(subCatName: "Skirts"),
            SubCatItems(subCatName: "Dresses"),
          ]
    }
  
    func numberOfItems() -> Int {
        return subCatItems.count
    }
    
    func item(at index: Int) -> SubCatItems {
        return subCatItems[index]
    }
}

