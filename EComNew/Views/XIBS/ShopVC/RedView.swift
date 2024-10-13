//
//  RedView.swift
//  EComNew
//
//  Created by Way2 on 04/07/24.
//

import UIKit

class RedView: UIView {
    // MARK: - ---------------- Public  Variables ----------------
    var view: UIView!
 
    // MARK: - ---------------- IBOutlets ----------------
  
    // MARK: - ---------------- Override Init ----------------
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
        
    }
    
    // MARK: - ---------------- Public Functions ----------------
    
    // MARK: - ---------------- Private Functions ----------------
    
    private func nibSetup() {
        view = viewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
        
        setUpViews()
    }
    
    private func viewFromNib() -> UIView {
        let bundle = Bundle(for: type(of:self))
        let nib = UINib(nibName:  ECOMAPP.VIEW.SHOPVCVIEW.REDVIEW, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
        
    }
    
    private func setUpViews() {
   
    }
    
        
}
