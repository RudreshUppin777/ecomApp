//
//  OrderDetailsTableViewCell.swift
//  EComNew
//
//  Created by Way2 on 21/10/24.
//

import UIKit

class OrderDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var statusLabl: UILabel!
    @IBOutlet weak var orderNumbLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var quantityLbl1: UILabel!
    @IBOutlet weak var trakingNumLbl1: UILabel!
    @IBOutlet weak var trakingNumLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var totalAmountLbl1: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var detailsBtnLbl: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    public func loadCellData(_ item: ProfileItems) {
        statusLabl.text = "Delivered"
        orderNumbLbl.text = " Order №1947034"
        trakingNumLbl1.text = "Tracking Number:"
        trakingNumLbl.text = "1122222"
        dateLbl.text = "05-12-2019"
        totalAmountLbl.text = "Total amount"
        totalAmountLbl1.text = "111"
        quantityLbl1.text = "Quantity :"
        quantityLbl.text = "3"
        
        
        statusLabl.font = CustomFont.medium.font(size: 16)
        orderNumbLbl.font = CustomFont.semibold.font(size: 16)
        trakingNumLbl1.font = CustomFont.medium.font(size: 14)
        trakingNumLbl.font = CustomFont.semibold.font(size: 16)
        dateLbl.font = CustomFont.semibold.font(size: 16)
        totalAmountLbl.font = CustomFont.semibold.font(size: 16)
        totalAmountLbl1.font = CustomFont.medium.font(size: 14)
        quantityLbl1.font = CustomFont.medium.font(size: 14)
        quantityLbl.font = CustomFont.semibold.font(size: 16)

    }
    
}
