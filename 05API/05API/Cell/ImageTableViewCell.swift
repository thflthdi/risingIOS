//
//  ImageTableViewCell.swift
//  05API
//
//  Created by 황예진 on 2022/12/23.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var clothesImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func setupImage(_ cellData: ImageMapping){
        self.clothesImage.image = cellData.image
    }
    
}
