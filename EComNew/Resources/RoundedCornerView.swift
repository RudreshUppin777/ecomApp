//
//  RoundedCornerView.swift
//  EComNew
//
//  Created by Way2 on 28/06/24.
//

import Foundation
import UIKit

@IBDesignable
class RoundedCornerView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = cornerRadius > 0
        }
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = cornerRadius > 0
    }
}

