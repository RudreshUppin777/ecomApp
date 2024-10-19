//
//  ViewController.swift
//  EComNew
//
//  Created by Way2 on 07/06/24.
//

import UIKit

class HomeViewController: UIViewController {
    weak var delegate: ChildViewControllerDelegate?

    @IBOutlet weak var saleClothsCollectionView: UICollectionView!
    @IBOutlet weak var newsClothsCollectionView: UICollectionView!
    
    // MARK: - ---------------- View LifeCycle Methods ----------------
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.title = ECOMAPP.VC.MAINVC
    }
 
    // MARK: - ---------------- Public Methods ----------------
    
  
    // MARK: - ---------------- Private Methods ----------------
    
    private func setUpViews() {
        setupCollectionViews()
    
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

