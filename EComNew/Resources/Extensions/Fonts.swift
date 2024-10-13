//
//  Fonts.swift
//  EComNew
//
//  Created by Way2 on 10/10/24.
//

import Foundation
import UIKit

enum CustomFont: String {
    case regular = "Metropolis-Regular"
    case bold = "Metropolis-Bold"
    case medium = "Metropolis-Medium"
    case black = "Metropolis-Black"
    case semibold = "Metropolis-SemiBold"

    func font(size: CGFloat) -> UIFont? {
        return UIFont(name: self.rawValue, size: size)
    }
}
