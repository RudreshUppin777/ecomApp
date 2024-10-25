//
//  Images.swift
//  EComNew
//
//  Created by Way2 on 14/10/24.
//


import Foundation
import UIKit

enum CustomImage: String {
    case CLOSERED = "closeRed"
    case OKGREEN = "okGreen"
    case OKEMAIL = "okEmail"
    case ACTIVEHOME = "activeHome"
    case ACTIVECART = "activeCart"
    case ACTIVEBAG = "activeBag"
    case ACTIVEHEART = "activeHeart"
    case ACTIVEPROFILE = "activeProfile"
    case INACTIVEHOME = "inactiveHome"
    case INACTIVECART = "inactiveCart"
    case INACTIVEBAG = "inactiveBag"
    case INACTIVEHEART = "inactiveHeart"
    case INACTIVEPROFILE = "inactiveProfile"
    func image() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
    
}
