//
//  ImageSelectionView.swift
//  EComNew
//
//  Created by Way2 on 17/10/24.
//

import UIKit

protocol ImageSelectViewDelegate: AnyObject {
    func didPressRemoveButton()
}

class ImageSelectionView: UIView {
  
    var view: UIView!
    weak var delegate: ImageSelectViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetUp()
    }
    
    // MARK: ----------------- Private Methods ----------------
   
    private func nibSetUp() {
       view = viewFromNib()
       view.frame = self.bounds
       view.autoresizingMask  = [.flexibleWidth , .flexibleHeight]
       view.translatesAutoresizingMaskIntoConstraints = true
       addSubview(view)
        setUpViews()
    }
    
    private func viewFromNib()->UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: ECOMAPP.VIEW.IMAGESELECTION, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    private func setUpViews() {
    }
    
    private func setUpTitleColor(for state: BottomMenuStates) {     
    }

    @IBAction func backBtnClick(_ sender: UIButton) {
        delegate?.didPressRemoveButton()
    }
    

    
    // MARK: ----------------- Public Methods ----------------

    
    // MARK: ----------------- IBActions ----------------
}
