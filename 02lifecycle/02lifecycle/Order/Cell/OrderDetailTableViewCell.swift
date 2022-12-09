//
//  OrderDetailTableViewCell.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/07.
//

import UIKit

class OrderDetailTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
//    }
//    
    @IBOutlet weak var setImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setupUI(_ cellData: setInfo) {
        self.setImage.image = cellData.setImage
        self.nameLabel.text = cellData.setName
        self.priceLabel.text = DecimalWon(cellData.setPrice)
    }
}
