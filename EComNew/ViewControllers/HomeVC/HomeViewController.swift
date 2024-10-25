//
//  ViewController.swift
//  EComNew
//
//  Created by Way2 on 07/06/24.
//

import UIKit
enum BottomMenuState: String {
    case home = "Home"
    case shop = "Shop"
    case bag = "Bag"
    case favourite = "Favourite"
    case profile = "Profile"
}

class HomeViewController: UIViewController,BottomMenuDelegateFromHomeVC{
    
    // MARK: ---------------- IBOutLets ----------------
    @IBOutlet weak var saleClothsCollectionView: UICollectionView!
    @IBOutlet weak var newsClothsCollectionView: UICollectionView!

    // MARK: ---------------- Variables ----------------
    var currentChildVC: UIViewController?
    private var homeViewModel = HomeViewModel()
    private let originalBottomMenuHeight: CGFloat = 86.0

    lazy var bottomMenu: BottomMenuView = {
        let bottomMenuChild = BottomMenuView()
        bottomMenuChild.delegateFromHomeVc  = self
        bottomMenuChild.frame = CGRect(
            x: 0,
            y: viewHeight-originalBottomMenuHeight,
            width: viewWidth,
            height: originalBottomMenuHeight
        )
        bottomMenuChild.roundCornersOnTopRightAndLeft(corners: [.topLeft, .topRight], radius: 15.0)
        return bottomMenuChild
    }()
    
    // MARK: ----------------- View LifeCycle Methods ----------------
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.title = ECOMAPP.VC.MAINVC
    }
    
    // MARK: - ---------------- Public Methods ----------------
    func didSelectMenuItem(at index: Int) {
        switch index {
        case 1:
            switchViewController(.home)
        case 2:
            switchViewController(.shop)
        case 3:
            switchViewController(.bag)
        case 4:
            switchViewController(.favourite)
        case 5:
            switchViewController(.profile)
        default:
            return // Handle invalid index if necessary
        }
    }

    // MARK: - ---------------- Private Methods Start ----------------
    private func setUpViews() {
        setupCollectionViews()
        addBottomMenu()
    }

    private func setupCollectionViews() {
        self.saleClothsCollectionView.delegate = self
        self.saleClothsCollectionView.dataSource = self
        self.newsClothsCollectionView.delegate = self
        self.newsClothsCollectionView.dataSource = self
        saleClothsCollectionView.register(UINib(nibName: ECOMAPP.CCELLNAME.SALECLOTH, bundle: nil), forCellWithReuseIdentifier: ECOMAPP.CCELLNAME.SALECLOTH)
        newsClothsCollectionView.register(UINib(nibName: ECOMAPP.CCELLNAME.SALECLOTH, bundle: nil), forCellWithReuseIdentifier: ECOMAPP.CCELLNAME.SALECLOTH)
        
        saleClothsCollectionView.reloadData()
        newsClothsCollectionView.reloadData()
    }
    
    private func switchViewController(_ state: BottomMenuStates) {
        switch state {
        case .home:
            if let mainVC: HomeViewController = UIStoryboard.instantiateViewController(storyboardName: "Main", identifier: ECOMAPP.VC.HOMEVC) {
                replaceChildViewController(with: mainVC)
            }
        case .shop:
            let shopvc = ShopViewController(nibName: ECOMAPP.VC.SHOPVC, bundle: nil)
            replaceChildViewController(with: shopvc)
        case .bag:
            let bagVC = BagViewController(nibName: ECOMAPP.VC.BAGVC, bundle: nil)
            replaceChildViewController(with: bagVC)
        case .favourite:
            let favVC = FavouriteViewController(nibName: ECOMAPP.VC.FAVVC, bundle: nil)
            replaceChildViewController(with: favVC)
        case .profile:
            let profileVC = ProfileSetViewController(nibName: ECOMAPP.VC.PROFILEVC, bundle: nil)
            replaceChildViewController(with: profileVC)
        }
        
    }

    private func replaceChildViewController(with newChildVC: UIViewController) {
        if let currentChildVC = currentChildVC {
            removeChildViewController(currentChildVC)
        }
        addChildvc1(newChildVC)
        currentChildVC = newChildVC
        addBottomMenu()
    }
    
    private func addChildvc1(_ childVC: UIViewController) {
        addChild(childVC)
        let adjustedFrame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        
        childVC.view.frame = adjustedFrame
        self.view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
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
    
    // MARK: - ---------------- Private Methods End --------------
    // MARK: - ---------------- IBActions Methods ----------------

}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == saleClothsCollectionView {
            return 5
        } else if collectionView == newsClothsCollectionView {
            return 10
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == saleClothsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ECOMAPP.CCELLNAME.SALECLOTH, for: indexPath) as? ClothCollectionViewCell else {
                    return UICollectionViewCell()
                }
            return cell
        }
        else if collectionView == newsClothsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ECOMAPP.CCELLNAME.SALECLOTH, for: indexPath) as? ClothCollectionViewCell else {
                    return UICollectionViewCell()
                }
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == saleClothsCollectionView {
           
        } else if collectionView == newsClothsCollectionView {
            
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == saleClothsCollectionView {
            // Calculate and return size for sale cloth cell
            return CGSize(width: 150, height: 266)
        } else if collectionView == newsClothsCollectionView {
            // Calculate and return size for news cloth cell
            return CGSize(width: 150, height: 266)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)  // Adjust insets as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

