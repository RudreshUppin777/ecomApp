//
//  ECOMAPP.swift
//  EComNew
//
//  Created by Way2 on 01/07/24.
//

import Foundation

enum ECOMAPP {
    enum VC {
        static let SIGNIN = "SignInViewController"

        static let HOMEVC = "HomeViewController"
        static let MAINVC = "MainViewController"
        static let SHOPVC = "ShopViewController"
        static let BAGVC = "BagViewController"
        static let FAVVC = "FavouriteViewController"
        static let PROFILEVC = "ProfileViewController"
        static let MYORDER = "MyOrderViewController"
        static let SHOPITMECART = "ShopItemsCatViewController"


    }
    enum CCELLNAME {
        static let NEWCLOTH = "NewClothCollectionViewCell"
        static let SALECLOTH = "ClothCollectionViewCell"
    }
    enum TCELLNAME {
        static let SHOPITEM = "ShopItemsTableViewCell"
        static let SUBCATITEMS = "SubCatItemsTableViewCell"
        static let PROFILEITEM = "ProfileItemTableViewCell"
    }
    
    enum VIEW {
        static let FORGETPASSWORD = "ForgetPasswordView"
        static let BOTTOMMENU = "BottomMenuView"
        enum SHOPVCVIEW {
            static let WOMENCAT = "CategoryView"
            static let REDVIEW = "RedView"
            static let MENCAT = "MenCatView"
            static let KIDSCAT = "KidsCatView"
        }
    }
    
    static let ENTERTHETEXTFIELD  = "Please enter the current field "
    static let ENTERTHEPASSWORD   = "Enter your Password"
    static let ENTERTHEEMAIL      = "Enter your Email"
    static let ENTERTHNAME        =    "Enter your name"
    static let CELLLOADERROR      =    "Unable to dequeue Cell"
    
    enum IMG {
        static let CLOSERED = "closeRed"
    }
}


