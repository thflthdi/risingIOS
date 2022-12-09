//
//  OrderCollectionViewCell.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/06.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    @IBOutlet weak var categoryUIVIew: UIView!

    public func setupUI(_ data: String){
        self.categoryNameLabel.text = data
    }
    
}
