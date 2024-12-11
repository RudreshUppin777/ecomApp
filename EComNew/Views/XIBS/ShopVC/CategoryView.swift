//
//  WomenCatView.swift
//  EComNew
//
//  Created by Way2 on 04/07/24.
//

import Foundation
import UIKit
import NVActivityIndicatorView

protocol WomenCatViewDelegate: AnyObject {
    func showAllWomenCartItems()
}

class CategoryView: UIView {
    // MARK: - ---------------- Public  Variables ----------------
    var view: UIView!
    var selectedIndex: Int?
    weak var womencartdelegate: WomenCatViewDelegate?
    private var indicatorView: NVActivityIndicatorView?
    private var loader: CustomRingLoader!
    
    let viewModel = ShopItemViewModal()
    let subCatViewModal = SubCatItemViewModal()
    
    // MARK: - ---------------- IBOutlets ----------------
    @IBOutlet weak var catTableView1: UITableView!
    @IBOutlet weak var subCatTableView: UITableView!
    @IBOutlet weak var heightCatTabCell: NSLayoutConstraint!
    @IBOutlet weak var heightSubCatTabCell: NSLayoutConstraint!
    @IBOutlet var womensCatView: UIView!
    @IBOutlet var kidsCatView: UIView!
    @IBOutlet var mensCatView: UIView!
    @IBOutlet weak var commingSoonLbl1: UILabel!
    @IBOutlet weak var commingSoonLbl2: UILabel!
    // MARK: - ---------------- Override Init ----------------
    
    init(frame: CGRect, index: Int) {
        super.init(frame: frame)
        self.selectedIndex = index
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
        
    }
    
    // MARK: ----------------- Public Functions ----------------
    
    // MARK: ---------------- Private Functions ----------------
    
    private func nibSetup() {
        view = viewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
        setUpViews()
        
    }
    
    private func viewFromNib() -> UIView {
        let bundle = Bundle(for: type(of:self))
        let nib = UINib(nibName:  ECOMAPP.VIEW.SHOPVCVIEW.WOMENCAT, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    private func setUpViews() {
        switch selectedIndex {
        case 0:
            setUpWomenView()
        case 1:
            setUpMenCatView()
        case 2:
            setUpKidsView()
        default:
            break
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        catrgoryCenterLoader(main: view)
        
    }
    
    private func setUpMenCatView() {
        mensCatView.removeFromSuperview()
        mensCatView.frame = view.bounds
        mensCatView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mensCatView)
        // commingSoonLbl1.isHidden = true
        setupLoader(for: mensCatView, main: view)
    }
    
    private func setUpWomenView() {
        womensCatView.removeFromSuperview()
        womensCatView.frame = view.bounds
        womensCatView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(womensCatView)
        womensCatView.isHidden = true
        setupLoader(for: womensCatView, main: view)
    }
    
    private func setUpKidsView() {
        kidsCatView.removeFromSuperview()
        kidsCatView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        kidsCatView.frame = view.bounds
        view.addSubview(kidsCatView)
        //  commingSoonLbl2.isHidden = true
        setupLoader(for: kidsCatView, main: view)
    }
    
    
    private func catrgoryCenterLoader(main: UIView) {
        guard let loader = loader else { return }
        
        let loaderSize: CGFloat = 30
        let topDisatnce: CGFloat = 15
        let xPosition = (main.bounds.width - loaderSize) / 2 - 10
        let yPosition = (main.bounds.height - loaderSize) / 2 - topDisatnce
        
        loader.frame = CGRect(x: xPosition, y: yPosition, width: loaderSize, height: loaderSize)
        
    }
    
    private func setupLoader(for childview:UIView, main:UIView) {
        loader = CustomRingLoader(frame: .zero)
        catrgoryCenterLoader(main: main)
        main.addSubview(loader)
        
        //self.view.backgroundColor =  .gray
        startLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.stopLoading()
            if (childview == self?.kidsCatView){
                //  self?.commingSoonLbl2.isHidden = false
            } else if (childview == self?.mensCatView){
                // self?.commingSoonLbl1.isHidden = false
            }
            else if (childview == self?.womensCatView){
                self?.womensCatView.isHidden = false
            }
            self?.setUpTableViewCell1()
        }
    }
    
    private func startLoading() {
        indicatorView?.startAnimating()
    }
    
    private func stopLoading() {
        indicatorView?.stopAnimating()
        loader.removeFromSuperview()
    }
    
    private func setUpTableViewCell1() {
        self.heightCatTabCell.constant = 500
        
        catTableView1.delegate = self
        catTableView1.dataSource = self
        self.catTableView1.register(UINib(nibName: ECOMAPP.TCELLNAME.SHOPITEM, bundle: nil), forCellReuseIdentifier: ECOMAPP.TCELLNAME.SHOPITEM)
        
        subCatTableView.delegate = self
        subCatTableView.dataSource = self
        self.subCatTableView.register(UINib(nibName: ECOMAPP.TCELLNAME.SUBCATITEMS, bundle: nil), forCellReuseIdentifier: ECOMAPP.TCELLNAME.SUBCATITEMS)
        
        if #available(iOS 15, *) {
            catTableView1.sectionHeaderTopPadding = 0
            subCatTableView.sectionHeaderTopPadding = 0
        }
        
        self.catTableView1.reloadData()
        self.subCatTableView.reloadData()
        
    }
    
    private func setUpTableViewCell2() {
        
    }
    
}


extension CategoryView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == catTableView1) {
            return viewModel.numberOfItems()
        }
        return subCatViewModal.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == catTableView1) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ECOMAPP.TCELLNAME.SHOPITEM) as? ShopItemsTableViewCell else {
                fatalError(ECOMAPP.CELLLOADERROR)
            }
            if (selectedIndex == 0) {
                let item = viewModel.item(at: indexPath.row)
                cell.loadCellData(item)
            }else if (selectedIndex == 1) {
                let item = viewModel.item(at: indexPath.row)
            }else if (selectedIndex == 2) {
                let item = viewModel.kidsSubCatItems(at: indexPath.row)
            }
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ECOMAPP.TCELLNAME.SUBCATITEMS) as? SubCatItemsTableViewCell else {
            fatalError(ECOMAPP.CELLLOADERROR)
        }
        let item = subCatViewModal.item(at: indexPath.row)
        cell.subCatName.text =  item.subCatName
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == catTableView1 {
            return 100.0
        }
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == catTableView1 {
            let headerView = UIView()
            let specialView = RedView()
            specialView.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(specialView)
            NSLayoutConstraint.activate([
                specialView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant:  10),
                specialView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: -10),
                specialView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10.0),
                specialView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10.0),
            ])
            
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == catTableView1 {
            return 100.0
        }
        return 45.0
    }
}
