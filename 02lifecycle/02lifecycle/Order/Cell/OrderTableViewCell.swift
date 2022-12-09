//
//  OrderTableViewCell.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/06.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var cellMenuImage: UIImageView!
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellPriceLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setupUI(_ cellData: burgerInfo) {
        self.cellMenuImage.image = cellData.imageAdd
        self.cellNameLabel.text = cellData.name
        self.cellPriceLabel.text = DecimalWon(cellData.price)
    }
    
}
