//
//  ProfileItemViewModal.swift
//  EComNew
//
//  Created by Way2 on 05/07/24.
//

import Foundation

class ProfileItemViewModal {
    
    var profileItems: [ProfileItems] = []
    
    init() {
        loadProfileItems()
    }
      
    func loadProfileItems() {
        profileItems = [
            ProfileItems(name: "My orders", subCatTitle:  "Already have 12 orders"),
            ProfileItems(name: "Shipping addresses", subCatTitle:  "3 dresses"),
            ProfileItems(name: "Payment methods", subCatTitle:  "Visa  **34"),
            ProfileItems(name: "Promocodes", subCatTitle:  "You have special promocodes"),
            ProfileItems(name: "My reviews", subCatTitle:  "Reviews for 4 items"),
            ProfileItems(name: "Settings", subCatTitle:  "Notifications, password"),
            ProfileItems(name: "LogOut", subCatTitle:  "logout account"),
        ]
    }
  
    func numberOfItems() -> Int {
        return profileItems.count
    }
    
    func item(at index: Int) -> ProfileItems {
        return profileItems[index]
    }
}

