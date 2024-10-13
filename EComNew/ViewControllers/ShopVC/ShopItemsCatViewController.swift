//
//  ShopItemsCatViewController.swift
//  EComNew
//
//  Created by Way2 on 09/07/24.
//

import UIKit

class ShopItemsCatViewController: UIViewController {
    
    let viewModel = ShopItemViewModal()
    let subCatViewModal = SubCatItemViewModal()
    
    // MARK: - ---------------- IBOutlets ----------------
    @IBOutlet weak var topSubCatCollectionview: UICollectionView!
    @IBOutlet weak var columnSubCatCollectionview: UICollectionView!
    @IBOutlet weak var rowSubCatListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupViews()
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
    
    @IBAction func switchRowOrColumnClicked(_ sender: UIButton) {
        
    }
    
}

extension ShopItemsCatViewController: UICollectionViewDataSource {
    
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

extension ShopItemsCatViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle item selection
        if collectionView == topSubCatCollectionview {
            
        } else if collectionView == columnSubCatCollectionview {
            
        }
    }
}

extension ShopItemsCatViewController: UICollectionViewDelegateFlowLayout {
    
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




extension ShopItemsCatViewController: UITableViewDataSource, UITableViewDelegate {
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
