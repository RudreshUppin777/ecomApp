//
//  BottomMenuView.swift
//  EComNew
//
//  Created by Way2 on 11/06/24.
//

import UIKit

enum BottomMenuStates: String {
    case home = "Home"
    case shop = "Shop"
    case bag = "Bag"
    case favourite = "Favourite"
    case profile = "Profile"
}

protocol BottomMenuViewDelegate: AnyObject {
    func didTapHomeViewController(_ state: BottomMenuStates)
}

class BottomMenuView: UIView {
  
    var view: UIView!
    weak var delegate: BottomMenuViewDelegate?

    @IBOutlet weak var homeImgView: UIImageView!
    @IBOutlet weak var cartImgView: UIImageView!
    @IBOutlet weak var bagImgView: UIImageView!
    @IBOutlet weak var favImgView: UIImageView!
    @IBOutlet weak var profileImgView: UIImageView!
    
    @IBOutlet weak var homeLbl: UILabel!
    @IBOutlet weak var shopLbl: UILabel!
    @IBOutlet weak var bagLbl: UILabel!
    @IBOutlet weak var favouriteLbl: UILabel!
    @IBOutlet weak var profileLbl: UILabel!
    
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
        let nib = UINib(nibName: ECOMAPP.VIEW.BOTTOMMENU, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    
    private func setUpViews() {
        setUpTitleColor(for: .home)
    }
    
    private func setUpTitleColor(for state: BottomMenuStates) {
        let inactiveColor = UIColor.customBottomGray
        let activeColor = UIColor.customBottomRed
        
        // Reset all labels to inactive color
        let labels = [homeLbl, shopLbl, bagLbl, favouriteLbl, profileLbl]
        labels.forEach { $0?.textColor = inactiveColor }
        
        homeImgView.image = UIImage(named: CustomImage.INACTIVEHOME.rawValue)
        cartImgView.image = UIImage(named: CustomImage.INACTIVECART.rawValue)
        bagImgView.image = UIImage(named: CustomImage.INACTIVEBAG.rawValue)
        favImgView.image = UIImage(named: "inactiveHeart")
        profileImgView.image = UIImage(named: "inactiveProfile")
               
        switch state {
        case .home:
            homeLbl.textColor = activeColor
            homeImgView.image = UIImage(named: "activeHome")
            delegate?.didTapHomeViewController(.home)
        case .shop:
            shopLbl.textColor = activeColor
            cartImgView.image = UIImage(named: "activeCart")
            delegate?.didTapHomeViewController(.shop)
        case .bag:
            bagLbl.textColor = activeColor
            bagImgView.image = UIImage(named: "activeBag")
            delegate?.didTapHomeViewController(.bag)
        case .favourite:
            favouriteLbl.textColor = activeColor
            favImgView.image = UIImage(named: "activeHeart")
            delegate?.didTapHomeViewController(.favourite)
        case .profile:
            profileLbl.textColor = activeColor
            profileImgView.image = UIImage(named: "activeProfile")
            delegate?.didTapHomeViewController(.profile)
        }
    }

    // MARK: ----------------- Public Methods ----------------

    
    // MARK: ----------------- IBActions ----------------
    @IBAction func homeBtnAction(_ sender: UIButton) {
        setUpTitleColor(for: .home)
    }
    
    @IBAction func shopBtnAction(_ sender: UIButton) {
        setUpTitleColor(for: .shop)
    }
    
    @IBAction func bagBtnAction(_ sender: UIButton) {
        setUpTitleColor(for: .bag)
    }
    
    @IBAction func favouriteBtnAction(_ sender: UIButton) {
        setUpTitleColor(for: .favourite)
    }
    
    @IBAction func profileBtnAction(_ sender: UIButton) {
        setUpTitleColor(for: .profile)
    }
    
}
