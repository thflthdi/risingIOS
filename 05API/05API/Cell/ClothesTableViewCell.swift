//
//  ClothesTableViewCell.swift
//  05API
//
//  Created by 황예진 on 2022/12/23.
//

import UIKit

class ClothesTableViewCell: UITableViewCell {
    @IBOutlet weak var panelUIView: UIView!
    @IBOutlet weak var clothesNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        panelUIView.clipsToBounds = true
        panelUIView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setupUI(_ cellData: ClothesInfo){
        clothesNameLabel.text = cellData.name
    }

}
