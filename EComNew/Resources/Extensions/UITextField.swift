//
//  UITextField.swift
//  EComNew
//
//  Created by Way2 on 13/06/24.
//

import Foundation
import UIKit

extension UITextField {
    func styleTextField(borderStyle: UITextField.BorderStyle,
                        borderColor: UIColor,
                        cornerRadius: CGFloat,
                        borderWidth: CGFloat,
                        placeholder: String,
                        placeholderFont: UIFont,
                        placeholderColor: UIColor) {
        self.borderStyle = borderStyle
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.placeholder = placeholder

      
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
                  NSAttributedString.Key.foregroundColor: placeholderColor,
                  NSAttributedString.Key.font: placeholderFont
        ])
    }
}
