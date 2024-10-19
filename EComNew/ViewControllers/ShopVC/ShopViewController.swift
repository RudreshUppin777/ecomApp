//
//  ShopViewController.swift
//  EComNew
//
//  Created by Way2 on 01/07/24.
//

import UIKit

class ShopViewController: UIViewController, WomenCatViewDelegate {
    weak var delegate: ChildViewControllerDelegate?
  
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var womenButton: UIButton!
    @IBOutlet weak var menButton: UIButton!
    @IBOutlet weak var kidsButton: UIButton!
    @IBOutlet weak var dupmainview: UIView!
    @IBOutlet weak var tabMenu: UIView!
    
    var catview : CategoryView!

    lazy var indicatorView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 3))
        view.backgroundColor = .red
        self.tabMenu.addSubview(view)
        return view
    }()

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
        if let shopitemvc: ShopItemsCatViewController = UIStoryboard.instantiateViewController(storyboardName: "Main", identifier: ECOMAPP.VC.SHOPITMECART) {
                   self.navigationController?.pushViewController(shopitemvc, animated: true)
        }
    }
    
    func showVisualSearchViewController() {
        
        if let visualsearchvc: VisualSearchViewController = UIStoryboard.instantiateViewController(storyboardName: "Main", identifier: ECOMAPP.VC.VISUALSEARCHVC) {
                   self.navigationController?.pushViewController(visualsearchvc, animated: true)
        }
    }
    
    // MARK: - ---------------- IBActions Methods ----------------
 
    
    @IBAction func visualSearchAct(_ sender: UIButton) {
        delegate?.didPerformAction(in: self)
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        let selectedIndex: Int
        selectedIndex = 0
        updateIndicatorPosition(selectedIndex: selectedIndex)
        loadSelectedView(index: 0)
    }
    
    @IBAction func menbuttonTapped(_ sender: UIButton) {
        let selectedIndex: Int
        selectedIndex = 1
        updateIndicatorPosition(selectedIndex: selectedIndex)
        loadSelectedView(index: 1)
    }
    
    @IBAction func kidsbuttonTapped(_ sender: UIButton) {
        let selectedIndex: Int
        selectedIndex = 2
        updateIndicatorPosition(selectedIndex: selectedIndex)
        loadSelectedView(index: 2)
    }

}
