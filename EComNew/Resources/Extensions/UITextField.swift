//
//  UITextField.swift
//  EComNew
//
//  Created by Way2 on 13/06/24.
//

import Foundation
import UIKit
enum TextFieldErrorState {
    case success
    case error
}

struct TextFieldStyle {
    var placeholder: String
    var placeholderColor: UIColor
    var borderColor: UIColor
    var errorState: TextFieldErrorState

}

extension UITextField {
    func styleTextField(style: TextFieldStyle) {
        let placeholderFont = UIFont.systemFont(ofSize: 14, weight: .regular)
       
        switch style.errorState {
        case .error:
            self.placeholder = style.placeholder
        case .success:
            self.borderStyle = .none
            self.placeholder = style.placeholder
        }
        
        self.borderStyle = .none
        self.layer.masksToBounds = true
        self.layer.borderColor = style.borderColor.cgColor
        
        self.attributedPlaceholder = NSAttributedString(string: style.placeholder, attributes: [
            NSAttributedString.Key.foregroundColor: style.placeholderColor,
            NSAttributedString.Key.font: placeholderFont
        ])
    }
}

// Usage
