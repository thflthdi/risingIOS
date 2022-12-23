//
//  MapTableViewCell.swift
//  05API
//
//  Created by 황예진 on 2022/12/23.
//

import UIKit

class MapTableViewCell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func setupUI(_ cellData: Address){
        addressLabel.text = cellData.road
    }
}
