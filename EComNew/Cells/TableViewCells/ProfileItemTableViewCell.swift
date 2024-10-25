//
//  ProfileItemTableViewCell.swift
//  EComNew
//
//  Created by Way2 on 02/07/24.
//

import UIKit

class ProfileItemTableViewCell: UITableViewCell {

    @IBOutlet weak var profileItemName: UILabel!
    @IBOutlet weak var profileItemSubTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - ---------------- IBActions Methods ----------------

    // MARK: - ---------------- Public Methods ----------------
    
    // MARK: - ---------------- Private Methods ----------------
    
    func loadCellData(_ item: ProfileItems) {
        self.profileItemName.text = item.name
        self.profileItemSubTitle.text = item.subCatTitle
        profileItemName.font = CustomFont.semibold.font(size: 16)
        profileItemSubTitle.font = CustomFont.regular.font(size: 11)
    }
}
