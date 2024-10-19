//
//  ProfileViewController.swift
//  EComNew
//
//  Created by Way2 on 01/07/24.
//

import UIKit

class ProfileViewController: UIViewController {
    let profileItemViewModal = ProfileItemViewModal()
    @IBOutlet weak var profileViewtableView: UITableView!
    weak var delegate: ChildViewControllerDelegate?

    // MARK: - ---------------- View LifeCycle Methods ----------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ECOMAPP.VC.PROFILEVC
        
        setupTableViewCell()
    }
    
    // MARK: - ---------------- IBActions Methods ----------------
    
    // MARK: - ---------------- Public Methods ----------------
    
    // MARK: - ---------------- Private Methods ----------------
    
    private func setupTableViewCell() {
        profileViewtableView.delegate = self
        profileViewtableView.dataSource = self
        self.profileViewtableView.register(UINib(nibName: ECOMAPP.TCELLNAME.PROFILEITEM, bundle: nil), forCellReuseIdentifier: ECOMAPP.TCELLNAME.PROFILEITEM)
        
        if #available(iOS 15, *) {
            profileViewtableView.sectionHeaderTopPadding = 0
        }
        profileViewtableView.reloadData()
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileItemViewModal.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ECOMAPP.TCELLNAME.PROFILEITEM) as? ProfileItemTableViewCell else {
            fatalError(ECOMAPP.CELLLOADERROR)
        }
        cell.selectionStyle = .none

        
        let item = profileItemViewModal.item(at: indexPath.row)
        cell.loadCellData(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath) is ProfileItemTableViewCell {
            // Do something with the cell if needed
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch indexPath.row {
        case 0:
            break
        case 1:
            break
        default:
            break
        }
        
    }
    
}
