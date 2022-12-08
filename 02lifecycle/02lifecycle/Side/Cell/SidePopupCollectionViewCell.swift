//
//  SidePopupCollectionViewCell.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/08.
//

import UIKit

class SidePopupCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.checkedImage.isHidden = true
    }

    @IBOutlet weak var sideImage: UIImageView!
    @IBOutlet weak var sideNameLabel: UILabel!
    @IBOutlet weak var sidePriceLabel: UILabel!
    @IBOutlet weak var checkedImage: UIImageView!
    
    
    public func setSelected() {
        if isSelected {
            self.checkedImage.isHidden = false
        }else {
            self.checkedImage.isHidden = true
        }
    }
    

    public func setupUI(_ cellData: sideMenuInfo) {
        self.sideImage.image = cellData.image
        self.sideNameLabel.text = cellData.name
        self.sidePriceLabel.text = "+" + String(cellData.price)
    }

}
