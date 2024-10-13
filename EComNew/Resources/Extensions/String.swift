//
//  String.swift
//  EComNew
//
//  Created by Way2 on 26/06/24.
//

import Foundation
extension String {
    func isValidName() -> Bool {
          // Define the regex pattern for a valid name
          // Only letters and spaces, minimum 1 character
          let regex = try! NSRegularExpression(pattern: "^[a-zA-Z ]{1,}$", options: .caseInsensitive)
          return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
                                  
    func isValidPassword() -> Bool {
        // Define the regex pattern for a valid password
        // Minimum 8 characters, at least one uppercase letter, one lowercase letter, one number and one special character
        let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,}$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
