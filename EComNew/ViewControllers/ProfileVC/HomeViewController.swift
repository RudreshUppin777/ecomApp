//
//  HomeViewController.swift
//  EComNew
//
//  Created by Way2 on 01/07/24.
//

import UIKit
enum BottomMenuState: String {
    case home = "Home"
    case shop = "Shop"
    case bag = "Bag"
    case favourite = "Favourite"
    case profile = "Profile"
}

class HomeViewController: UIViewController ,BottomMenuViewDelegate{
    var currentChildVC: UIViewController?

    lazy var bottomMenu: BottomMenuView = {
        let bottomMenuChild = BottomMenuView()
        bottomMenuChild.delegate = self
        bottomMenuChild.frame = CGRect(
            x: 0,
            y: viewHeight-86,
            width: viewWidth,
            height: 86
        )
        bottomMenuChild.roundCornersOnTopRightAndLeft(corners: [.topLeft, .topRight], radius: 15.0)
        return bottomMenuChild
    }()
    
    
    private func replaceChildViewController(with newChildVC: UIViewController) {
        if let currentChildVC = currentChildVC {
            removeChildViewController(currentChildVC)
        }
        addChildvc1(newChildVC)
        currentChildVC = newChildVC
       
        self.view.addSubview(bottomMenu)
        self.view.bringSubviewToFront(bottomMenu)
    }
    
    func addChildvc1(_ childVC: UIViewController) {
        addChild(childVC)
        let adjustedFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 86)
        
        childVC.view.frame = adjustedFrame
        self.view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
    }
    
    private func removeChildViewController(_ childVC: UIViewController) {
        
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
        bottomMenu.removeFromSuperview()
        
    }
        
    // MARK: - ---------------- View LifeCycle Methods ----------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    // MARK: - ---------------- Public Methods ----------------
    func didTapHomeViewController(_ state: BottomMenuStates) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch state {
        case .home:
            if let mainVC = storyboard.instantiateViewController(withIdentifier: ECOMAPP.VC.MAINVC) as? MainViewController {
                replaceChildViewController(with: mainVC)
            }
        case .shop:
            if let shopvc = storyboard.instantiateViewController(withIdentifier: ECOMAPP.VC.SHOPVC) as? ShopViewController {
                replaceChildViewController(with: shopvc)
            }
            
        case .bag:
            if let bagVC = storyboard.instantiateViewController(withIdentifier: ECOMAPP.VC.BAGVC) as? BagViewController {
                replaceChildViewController(with: bagVC)
            }
            
        case .favourite:
            if let mainVC = storyboard.instantiateViewController(withIdentifier: ECOMAPP.VC.FAVVC) as? FavouriteViewController {
                replaceChildViewController(with: mainVC)
            }
            
        case .profile:
            if let mainVC = storyboard.instantiateViewController(withIdentifier: ECOMAPP.VC.PROFILEVC) as? ProfileViewController {
                replaceChildViewController(with: mainVC)
            }
        }
        
    }
      
    // MARK: - ---------------- Private Methods ----------------
    
    func setUpViews() {
        if currentChildVC == nil, let mainVC = storyboard?.instantiateViewController(withIdentifier: ECOMAPP.VC.MAINVC) as? MainViewController {
            replaceChildViewController(with: mainVC)
        }
    }
}


