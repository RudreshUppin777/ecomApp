//
//  ShopViewController.swift
//  EComNew
//
//  Created by Way2 on 24/10/24.
//

import UIKit

class ShopViewController: UIViewController, WomenCatViewDelegate {
    // MARK: - ---------------- Variables ----------------

    var catview : CategoryView!
    private let originalBottomMenuHeight: CGFloat = 86.0
    lazy var bottomMenu: BottomMenuView = {
        let bottomMenuChild = BottomMenuView()
        //bottomMenuChild.delegateFromHomeVc  = self
        bottomMenuChild.frame = CGRect(
            x: 0,
            y: viewHeight-originalBottomMenuHeight,
            width: viewWidth,
            height: originalBottomMenuHeight
        )
        bottomMenuChild.roundCornersOnTopRightAndLeft(corners: [.topLeft, .topRight], radius: 15.0)
        return bottomMenuChild
    }()
    
    lazy var indicatorView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 3))
        view.backgroundColor = .red
        self.tabMenu.addSubview(view)
        return view
    }()
    
    let viewModel = ShopItemViewModal()
    let subCatViewModal = SubCatItemViewModal()
    
    // MARK: - ---------------- IBOutlets ----------------
    @IBOutlet weak var topSubCatCollectionview: UICollectionView!
    @IBOutlet weak var columnSubCatCollectionview: UICollectionView!
    @IBOutlet weak var rowSubCatListView: UITableView!
    
    // MARK: - ---------------- IB Outlest ----------------
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var womenButton: UIButton!
    @IBOutlet weak var menButton: UIButton!
    @IBOutlet weak var kidsButton: UIButton!
    @IBOutlet weak var dupmainview: UIView!
    @IBOutlet weak var tabMenu: UIView!

    // MARK: - ---------------- View LifeCycle Methods ----------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        self.title = ECOMAPP.VC.SHOPVC
        
        guard let selectedButton = buttonStackView.arrangedSubviews[0] as? UIButton else { return }
        let buttonFrameInSuperview = selectedButton.convert(selectedButton.bounds, to: self.tabMenu)
        let width = buttonFrameInSuperview.width
        self.indicatorView.frame.origin.x = buttonFrameInSuperview.origin.x
        self.indicatorView.frame.size.width = width
        
        loadSelectedView(index: 0)
    }
    
    // MARK: - ---------------- Private Methods ----------------
    private func updateIndicatorPosition(selectedIndex: Int) {
        guard let selectedButton = buttonStackView.arrangedSubviews[selectedIndex] as? UIButton else { return }
        let buttonFrameInSuperview = selectedButton.convert(selectedButton.bounds, to: self.tabMenu)
        let width = buttonFrameInSuperview.width
        
        UIView.animate(withDuration: 0.3) {
            self.indicatorView.frame.origin.x = buttonFrameInSuperview.origin.x
            self.indicatorView.frame.size.width = width
        }
    }
    
    private func loadSelectedView(index: Int) {
        catview = CategoryView(frame: .zero, index: index)
        catview.frame = dupmainview.bounds
        dupmainview.addSubview(catview)
    }
    
    // MARK: - ---------------- Public Methods ----------------

    func showAllWomenCartItems() {
//        if let shopitemvc: ShopItemsCatViewController = UIStoryboard.instantiateViewController(storyboardName: "Main", identifier: ECOMAPP.VC.SHOPITMECART) {
//            self.navigationController?.pushViewController(shopitemvc, animated: true)
//        }
    }
    
    func showVisualSearchViewController() {
        
    }
    
    // MARK: - ---------------- IBActions Methods ----------------
    @IBAction func visualSearchAct(_ sender: UIButton) {
//        delegate?.didPerformAction(in: self)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let selectedIndex = sender.tag
         updateIndicatorPosition(selectedIndex: selectedIndex)
         loadSelectedView(index: selectedIndex)
    }
    

    private func setupViews() {
        setUpCollectionViewCell()
        setUpTableViewCell()
    }

    private func setUpTableViewCell() {
        rowSubCatListView.delegate = self
        rowSubCatListView.dataSource = self
        self.rowSubCatListView.register(UINib(nibName: ECOMAPP.TCELLNAME.SHOPITEM, bundle: nil), forCellReuseIdentifier: ECOMAPP.TCELLNAME.SHOPITEM)
        if #available(iOS 15, *) {
            rowSubCatListView.sectionHeaderTopPadding = 0
        }
        rowSubCatListView.reloadData()
    }
    
    private func setUpCollectionViewCell() {
        topSubCatCollectionview.delegate = self
        topSubCatCollectionview.dataSource = self
        topSubCatCollectionview.register(UINib(nibName: ECOMAPP.CCELLNAME.SALECLOTH, bundle: nil), forCellWithReuseIdentifier: ECOMAPP.CCELLNAME.SALECLOTH)
        topSubCatCollectionview.reloadData()
        
        columnSubCatCollectionview.delegate = self
        columnSubCatCollectionview.dataSource = self
        columnSubCatCollectionview.register(UINib(nibName: ECOMAPP.CCELLNAME.SALECLOTH, bundle: nil), forCellWithReuseIdentifier: ECOMAPP.CCELLNAME.SALECLOTH)
        columnSubCatCollectionview.reloadData()
    }
    
    private func loadRowOrColumnCategoryList() {
        // emum cased row initially load
        // row load tableview
        // column  load collectionview
        
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension ShopViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return number of items based on collectionView
        if collectionView == topSubCatCollectionview {
            return 5
        } else if collectionView == columnSubCatCollectionview {
            return 10
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topSubCatCollectionview {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ECOMAPP.CCELLNAME.SALECLOTH, for: indexPath) as! ClothCollectionViewCell
            return cell
        }
        else if collectionView == columnSubCatCollectionview {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ECOMAPP.CCELLNAME.SALECLOTH, for: indexPath) as! ClothCollectionViewCell
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ShopViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle item selection
        if collectionView == topSubCatCollectionview {
            
        } else if collectionView == columnSubCatCollectionview {
            
        }
    }
}

extension ShopViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topSubCatCollectionview {
            // Calculate and return size for sale cloth cell
            return CGSize(width: 150, height: 266)
        } else if collectionView == columnSubCatCollectionview {
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




extension ShopViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return subCatViewModal.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ECOMAPP.TCELLNAME.SHOPITEM) as? ShopItemsTableViewCell else {
            fatalError(ECOMAPP.CELLLOADERROR)
        }
        let item = viewModel.item(at: indexPath.row)
        cell.loadCellData(item)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
