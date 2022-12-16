//
//  testCollectionViewCell.swift
//  03Game
//
//  Created by 황예진 on 2022/12/16.
//

import UIKit

protocol UpgradeCollectionCellDelegate: AnyObject {
    func buttonTap()
}
class UpgradeCollectionCell: UICollectionViewCell {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var upgradeBtn: UIButton!
    weak var delegate: UpgradeCollectionCellDelegate?
    
    override func prepareForReuse() {
           super.prepareForReuse()
        self.upgradeBtn.isEnabled = false
       }
    
    @IBAction func upgradeBtnDidTap(_ sender: UIButton) {
        self.delegate?.buttonTap()
    }
}
