//
//  ShopItemViewModal.swift
//  EComNew
//
//  Created by Way2 on 04/07/24.
//

import Foundation
import UIKit
class ShopItemViewModal {
    
    var shopItems: [ShopItem] = []
    var shopWomenSubCatItems: [ShopWomenSubCatItems] = []
    var shopKidsSubCatItems: [ShopKidsSubCatItems] = []

    init() {
        setUpViews()
    }
    
    private func setUpViews() {
        loadShopItems()
        loadWomenSubCatItems()
    }
      
    func loadShopItems() {
          shopItems = [
              ShopItem(name: "New", imageName: "newimg"),
              ShopItem(name: "Clothes", imageName: "clothimg"),
              ShopItem(name: "Shoes", imageName: "shoesimg"),
              ShopItem(name: "Accessories", imageName: "accessoriesimg")
          ]
    }
    
    func loadWomenSubCatItems() {
        shopWomenSubCatItems = [
            ShopWomenSubCatItems(name: "New", imageName: "newimg"),
            ShopWomenSubCatItems(name: "Clothes", imageName: "clothimg"),
            ShopWomenSubCatItems(name: "Shoes", imageName: "shoesimg"),
            ShopWomenSubCatItems(name: "Accessories", imageName: "accessoriesimg")
          ]
    }
    
    func loadKidsSubCatItems() {
        shopKidsSubCatItems = [
            ShopKidsSubCatItems(name: "New", imageName: "newimg"),
            ShopKidsSubCatItems(name: "Clothes", imageName: "clothimg"),
            ShopKidsSubCatItems(name: "Shoes", imageName: "shoesimg"),
            ShopKidsSubCatItems(name: "Accessories", imageName: "accessoriesimg")
          ]
    }
  
    func numberOfItems() -> Int {
        return shopItems.count
    }
    
    func item(at index: Int) -> ShopItem {
        return shopItems[index]
    }
    
    func womenSubCatnumberOfItems() -> Int {
        return shopWomenSubCatItems.count
    }
    
    func womenSubCatItems(at index: Int) -> ShopWomenSubCatItems {
        return shopWomenSubCatItems[index]
    }
    
    func kidsSubCatnumberOfItems() -> Int {
        return shopKidsSubCatItems.count
    }
    
    func kidsSubCatItems(at index: Int) -> ShopKidsSubCatItems {
        return shopKidsSubCatItems[index]
    }
    
}

