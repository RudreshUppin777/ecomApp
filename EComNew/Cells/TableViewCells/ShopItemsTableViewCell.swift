//
//  ShopItemsTableViewCell.swift
//  EComNew
//
//  Created by Way2 on 02/07/24.
//

import UIKit

class ShopItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var contentBG: UIView!
    
    @IBOutlet weak var catTypeImg: UIImageView!
    
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
    func loadCellData(_ item: ShopItem) {
        self.catName.text = item.name
        self.catTypeImg.image = UIImage(named: item.imageName)
    }
}
