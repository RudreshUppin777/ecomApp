//
//  FavouriteViewController.swift
//  EComNew
//
//  Created by Way2 on 24/10/24.
//

import UIKit

import UIKit
import NVActivityIndicatorView

class FavouriteViewController: UIViewController {

    //let favItemViewModal = FavItemViewModal()
    private var indicatorView: NVActivityIndicatorView?
    private var comingSoonLabel: UILabel?
    private var loader: CustomRingLoader!

    // MARK: - ---------------- View LifeCycle Methods ----------------

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ECOMAPP.VC.FAVVC

        setupTableViewCell()
        setUpViews()
    }
    
    override func viewDidLayoutSubviews() {
       // loader.center = CGPoint(x: self.view.bounds.midX, y:self.view.bounds.midY)
        favcenterLoader()
    }
    
    private func favcenterLoader() {
        guard let loader = loader else { return }
        let topDistance: CGFloat = 15
        let loaderSize: CGFloat = 30
        let xPosition = (self.view.bounds.width - loaderSize) / 2 
        let yPosition = (self.view.bounds.height - loaderSize) / 2
        
        loader.frame = CGRect(x: xPosition, y: yPosition, width: loaderSize, height: loaderSize)
 
        
     
    }

      private func setUpViews() {
          let frame1 = CGRect(x: midXValue - 15, y: midYValue - 15, width: 30, height: 30)
          loader = CustomRingLoader(frame: .zero)
          
          //loader.center = view.center
          view.addSubview(loader)
          favcenterLoader()
          // Start or stop animation as needed
          startLoading()
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
              self?.stopLoading()
              self?.showComingSoonLabel()
          }
      }
      
      private func showComingSoonLabel() {
          let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
          label.center = view.center
          label.textAlignment = .center
          label.text = "Coming Soon"
          label.textColor = .red
          view.addSubview(label)
          comingSoonLabel = label
      }
      
      private func startLoading() {
          indicatorView?.startAnimating()
      }
      
      private func stopLoading() {
          indicatorView?.stopAnimating()
          loader.removeFromSuperview()
      }
      

    // MARK: - ---------------- IBActions Methods ----------------

    // MARK: - ---------------- Public Methods ----------------
    
    // MARK: - ---------------- Private Methods ----------------
    
    private func setupTableViewCell() {
//        profileViewtableView.delegate = self
//        profileViewtableView.dataSource = self
//        self.profileViewtableView.register(UINib(nibName: ECOMAPP.TCELLNAME.PROFILEITEM, bundle: nil), forCellReuseIdentifier: ECOMAPP.TCELLNAME.PROFILEITEM)
//
//        if #available(iOS 15, *) {
//            profileViewtableView.sectionHeaderTopPadding = 0
//        }
//        profileViewtableView.reloadData()
    }
}

//extension FavouriteViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return profileItemViewModal.numberOfItems()
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ECOMAPP.TCELLNAME.PROFILEITEM) as? ProfileItemTableViewCell else {
//            fatalError(ECOMAPP.CELLLOADERROR)
//        }
//        let item = profileItemViewModal.item(at: indexPath.row)
//        cell.loadCellData(item)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100.0
//    }
//}
