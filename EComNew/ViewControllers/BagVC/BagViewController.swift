//
//  BagViewController.swift
//  EComNew
//
//  Created by Way2 on 22/10/24.
//

import UIKit
import NVActivityIndicatorView

class BagViewController: UIViewController {
   // weak var delegate: ChildViewControllerDelegate?

    private var indicatorView: NVActivityIndicatorView?
    private var comingSoonLabel: UILabel?
    // Create an instance of CustomRingLoader
    private var loader: CustomRingLoader!

    // MARK: - ---------------- View LifeCycle Methods ----------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ECOMAPP.VC.BAGVC
        setUpViews()
    }
    // MARK: - ---------------- Public Methods ----------------
    // MARK: - ---------------- Private Methods ----------------
//    private func centerLoader() {
//        guard let loader = loader else { return }
//
//        let loaderSize: CGFloat = 30
//        let centerX = self.view.bounds.midX
//        let centerY = self.view.bounds.midY
//
//        let frame = CGRect(
//            x: centerX - loaderSize / 2,
//            y: centerY - loaderSize / 2,
//            width: loaderSize,
//            height: loaderSize
//        )
//        loader.frame = frame
//    }
    
    private func bagcenterLoader() {
        guard let loader = loader else { return }
        
        // Set loader frame to match view bounds (accounts for safe area automatically)
        loader.frame = view.bounds
        
        // Calculate center point in the loader's coordinate system (which matches view.bounds)
        // This ensures the loader is centered at view.center position, accounting for safe area
        let centerPoint = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        loader.updateCenterPoint(centerPoint)
    }
    
    private func setUpViews() {
        // Initialize loader with view bounds to fill entire view
        loader = CustomRingLoader(frame: view.bounds)
        view.addSubview(loader)
        bagcenterLoader()
        
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
    
    override func viewDidLayoutSubviews() {
        bagcenterLoader()
    }
 
    private func startLoading() {
        indicatorView?.startAnimating()
    }
    
    private func stopLoading() {
        indicatorView?.stopAnimating()
        loader.removeFromSuperview()
    }
    // MARK: - ---------------- IBActions Methods ----------------
}



