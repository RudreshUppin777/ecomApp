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
protocol ChildViewControllerDelegate: AnyObject {
    func didPerformAction(in viewController: UIViewController)
}
class MainViewController: UIViewController ,BottomMenuViewDelegate,ImageSelectViewDelegate{
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
    
    lazy var imageSelectView: ImageSelectionView = {
        let viewChild = ImageSelectionView()
        viewChild.delegate = self
        let safeAreaInsets = view.safeAreaInsets
        viewChild.frame = CGRect(
            x: 0,
            y: viewHeight,
            width: viewWidth,
            height: viewHeight  - safeAreaInsets.bottom
        )
        return viewChild
    }()
    
    private var isImageSearchViewVisible = false
    

    // MARK: - ---------------- View LifeCycle Methods ----------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    // MARK: - ---------------- Public Methods ----------------
    func setUpViews() {
        if currentChildVC == nil, let mainVC = storyboard?.instantiateViewController(withIdentifier: ECOMAPP.VC.HOMEVC) as? HomeViewController {
            replaceChildViewController(with: mainVC)
        }
    }
    
    func didTapHomeViewController(_ state: BottomMenuStates) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch state {
        case .home:
            if let mainVC = storyboard.instantiateViewController(withIdentifier: ECOMAPP.VC.HOMEVC) as? HomeViewController {
                mainVC.delegate = self
                replaceChildViewController(with: mainVC)
            }
        case .shop:
            if let shopvc = storyboard.instantiateViewController(withIdentifier: ECOMAPP.VC.SHOPVC) as? ShopViewController {
                shopvc.delegate = self
                replaceChildViewController(with: shopvc)
            }
            
        case .bag:
            if let bagVC = storyboard.instantiateViewController(withIdentifier: ECOMAPP.VC.BAGVC) as? BagViewController {
                bagVC.delegate = self
                replaceChildViewController(with: bagVC)
            }
            
        case .favourite:
            if let mainVC = storyboard.instantiateViewController(withIdentifier: ECOMAPP.VC.FAVVC) as? FavouriteViewController {
                mainVC.delegate = self
                replaceChildViewController(with: mainVC)
            }
            
        case .profile:
            if let mainVC = storyboard.instantiateViewController(withIdentifier: ECOMAPP.VC.PROFILEVC) as? ProfileViewController {
                mainVC.delegate = self
                replaceChildViewController(with: mainVC)
            }
        }
        
    }
    
    func addChildvc1(_ childVC: UIViewController) {
        addChild(childVC)
        let adjustedFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 86)
        
        childVC.view.frame = adjustedFrame
        self.view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
    }
    
    // MARK: - ---------------- Private Methods ----------------
    private func replaceChildViewController(with newChildVC: UIViewController) {
        if let currentChildVC = currentChildVC {
            removeChildViewController(currentChildVC)
        }
        addChildvc1(newChildVC)
        currentChildVC = newChildVC
        
        addBottomMenu()
    }
    
    private func removeChildViewController(_ childVC: UIViewController) {
        
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
        
        removeBottomMenu()
    }
    
    private func addBottomMenu() {
        self.view.addSubview(bottomMenu)
        self.view.bringSubviewToFront(bottomMenu)
    }
    
    private func removeBottomMenu() {
        bottomMenu.removeFromSuperview()
    }
        
    private func setUpImagSelectview() {
        self.view.addSubview(imageSelectView)
        addAndRemoveImageSelectView()
    }
    
    func didPressRemoveButton() {
        addAndRemoveImageSelectView()
    }
    
    private func addAndRemoveImageSelectView() {
        let finalYPosition: CGFloat
        let animationDuration: TimeInterval = 0.5
        
        if isImageSearchViewVisible {
            finalYPosition = self.view.frame.height
        } else {
            self.view.addSubview(imageSelectView)
            finalYPosition = 0
        }
        
        UIView.animate(withDuration: animationDuration,
                       delay: 0,
                       options: [.curveEaseOut],
                       animations: {
            self.imageSelectView.frame.origin.y = finalYPosition
        }, completion: { _ in
            if self.isImageSearchViewVisible {
                self.imageSelectView.removeFromSuperview()
            }
            self.isImageSearchViewVisible.toggle()
        })
    }
    
   

}


extension MainViewController: ChildViewControllerDelegate {
    func didPerformAction(in viewController: UIViewController) {
        // Handle the action here
        if viewController is HomeViewController {
            print("Action performed in HomeViewController")
        } else if viewController is ShopViewController {
            print("Action performed in ShopViewController")
            setUpImagSelectview()
        } else if viewController is BagViewController {
            print("Action performed in BagViewController")
        } else if viewController is FavouriteViewController {
            print("Action performed in FavouriteViewController")
        } else if viewController is ProfileViewController {
            print("Action performed in ProfileViewController")
        }
    }
}
