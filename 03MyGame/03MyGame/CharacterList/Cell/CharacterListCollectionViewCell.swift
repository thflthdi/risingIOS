//
//  CharacterListCollectionViewCell.swift
//  03MyGame
//
//  Created by 황예진 on 2022/12/14.
//

import UIKit

class CharacterListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var blindView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setupUI(_ cellData: RobotInfo){
        self.characterImage.image = cellData.image
        self.blindView.isHidden = false
    }
}
