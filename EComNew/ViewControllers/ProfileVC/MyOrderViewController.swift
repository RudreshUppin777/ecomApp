//
//  MyOrderViewController.swift
//  EComNew
//
//  Created by Way2 on 05/07/24.
//

import UIKit

class MyOrderViewController: UIViewController {
    
    // MARK: ----------------- View LifeCycle Methods ---------
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - ---------------- Public Methods ----------------
    
    // MARK: - ---------------- Private Methods ---------------
    
    private func setUpViews() {
        self.title = ECOMAPP.VC.MYORDER
    }
    
    // MARK: - ---------------- IBActions Methods -------------
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
