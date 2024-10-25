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
        static let SIGNUP = "SignUpViewController"

        static let MAINVC = "MainViewController"
        static let HOMEVC = "HomeViewController"
        static let SHOPVC = "ShopViewController"
        static let BAGVC = "BagViewController"
        static let FAVVC = "FavouriteViewController"
        static let PROFILEVC = "ProfileSetViewController"
        static let MYORDER = "MyOrderViewController"
        static let SHOPITMECART = "ShopItemsCatViewController"
        static let VISUALSEARCHVC = "VisualSearchViewController"


    }
    enum CCELLNAME {
        static let NEWCLOTH = "NewClothCollectionViewCell"
        static let SALECLOTH = "ClothCollectionViewCell"
    }
    enum TCELLNAME {
        static let SHOPITEM = "ShopItemsTableViewCell"
        static let SUBCATITEMS = "SubCatItemsTableViewCell"
    }
    
    enum VIEW {
        static let FORGETPASSWORD = "ForgetPasswordView"
        static let BOTTOMMENU = "BottomMenuView"
        static let IMAGESELECTION = "ImageSelectionView"

        enum SHOPVCVIEW {
            static let WOMENCAT = "CategoryView"
            static let REDVIEW = "RedView"
            static let MENCAT = "MenCatView"
            static let KIDSCAT = "KidsCatView"
        }
        
        enum PROFILEVC {
            static let ORDERDETAIL = "OrderDetailsTableViewCell"
            static let PROFILEITEM = "ProfileItemTableViewCell"

        }
    }
    
    static let ENTERTHETEXTFIELD  = "Please enter the current field "
    static let ENTERTHEPASSWORD   = "Enter your Password"
    static let ENTERTHEEMAIL      = "Enter your Email"
    static let ENTERTHNAME        =    "Enter your name"
    static let CELLLOADERROR      =    "Unable to dequeue Cell"
    static let ENTERTHRVALIDNAME      =    "Please enter a valid name before proceeding."
    static let ENTERTHEVALIDEMAIL      =    "Please enter a valid email address before proceeding."
    static let VALIDNAME      =    "Please enter a valid name."
    static let VALIDEMAIL      =    "Please enter a valid email address."
    static let VALIDPASSWORD      =    "Please enter a valid password."

}


