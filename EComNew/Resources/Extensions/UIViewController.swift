//
//  UIViewController.swift
//  EComNew
//
//  Created by Way2 on 10/06/24.
//

import Foundation
import UIKit

extension UIViewController {
    var midXValue:CGFloat {
        return UIScreen.main.bounds.midX
    }
    
    var midYValue:CGFloat {
        return UIScreen.main.bounds.midY
    }
    
    
    var viewWidth:CGFloat {
        return view.frame.width
    }

    var viewHeight:CGFloat {
        return view.frame.height
    }
    
    var mainHeight:CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var mainWidth:CGFloat {
        return UIScreen.main.bounds.width
    }
    
    
    var safeAreaInsists:UIEdgeInsets {
        return view.safeAreaInsets
    }
    
    func showAlert(message: String, okAction: (() -> Void)? = nil) {
           let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
           let okButton = UIAlertAction(title: "OK", style: .default) { _ in
               okAction?()
           }
           alertController.addAction(okButton)
           present(alertController, animated: true, completion: nil)
       }
}

extension UIStoryboard {
    static func instantiateViewController<T: UIViewController>(storyboardName: String, identifier: String) -> T? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as? T
    }
}
