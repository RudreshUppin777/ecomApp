//
//  MainHomeViewController.swift
//  EComNew
//
//  Created by Way2 on 05/12/24.
//


import UIKit
enum BottomMenuState: String {
    case home = "Home"
    case shop = "Shop"
    case bag = "Bag"
    case favourite = "Favourite"
    case profile = "Profile"
}

class MainHomeViewController: UIViewController,BottomMenuDelegateFromHomeVC{
    
    // MARK: ---------------- IBOutLets ----------------
    @IBOutlet weak var saleClothsCollectionView: UICollectionView!
    @IBOutlet weak var newsClothsCollectionView: UICollectionView!

    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var saleviewall: UIButton!
    @IBOutlet weak var newviewall: UIButton!

    @IBOutlet weak var fashionlbl: UILabel!
    @IBOutlet weak var newCollectionLbl: UILabel!
    @IBOutlet weak var summerSaleLbl: UILabel!
    @IBOutlet weak var blackSaleLbl: UILabel!
    @IBOutlet weak var mensHoddieLbl: UILabel!
    @IBOutlet weak var streetClothLbl: UILabel!
    @IBOutlet weak var saleLbl: UILabel!
    @IBOutlet weak var saleLbl1: UILabel!
    @IBOutlet weak var newLbl: UILabel!
    @IBOutlet weak var newLbl1: UILabel!
    
    
    
    // MARK: ---------------- Variables ----------------
    var currentChildVC: UIViewController?
    private var homeViewModel = HomeViewModel()
    private let originalBottomMenuHeight: CGFloat = 86.0

    lazy var bottomMenu: BottomMenuView = {
        let bottomMenuChild = BottomMenuView()
        bottomMenuChild.delegateFromHomeVc  = self
        bottomMenuChild.frame = CGRect(
            x: 0,
            y: mainHeight-originalBottomMenuHeight,
            width: mainWidth,
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
        setUpFonts()
        setupCollectionViews()
        addBottomMenu()
    }
    
    private func setUpFonts() {
//        @IBOutlet weak var checkBtn: UIButton!
//        @IBOutlet weak var saleviewall: UIButton!
//        @IBOutlet weak var newviewall: UIButton!
        
//
//        @IBOutlet weak var saleLbl: UILabel!
//        @IBOutlet weak var saleLbl1: UILabel!
//        @IBOutlet weak var newLbl: UILabel!
//        @IBOutlet weak var newLbl1: UILabel!
        
        fashionlbl.font = CustomFont.black.font(size: 48)
        
        streetClothLbl.font = CustomFont.black.font(size: 34)
        newCollectionLbl.font = CustomFont.bold.font(size: 34)
        summerSaleLbl.font = CustomFont.bold.font(size: 34)
        summerSaleLbl.font = CustomFont.bold.font(size: 34)
        blackSaleLbl.font = CustomFont.bold.font(size: 34)
        mensHoddieLbl.font = CustomFont.bold.font(size: 34)
        
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
            let mainVC = MainHomeViewController(nibName: ECOMAPP.VC.MAINHOME, bundle: nil)
            replaceChildViewController(with: mainVC)
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
    
        self.view.insertSubview(bottomMenu, at: 0)
        self.view.bringSubviewToFront(bottomMenu)
    }
    
    private func removeBottomMenu() {
        bottomMenu.removeFromSuperview()
    }
    
    // MARK: - ---------------- Private Methods End --------------
    // MARK: - ---------------- IBActions Methods ----------------

}

extension MainHomeViewController: UICollectionViewDataSource {
    
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

extension MainHomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == saleClothsCollectionView {
           
        } else if collectionView == newsClothsCollectionView {
            
        }
    }
}

extension MainHomeViewController: UICollectionViewDelegateFlowLayout {
    
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

