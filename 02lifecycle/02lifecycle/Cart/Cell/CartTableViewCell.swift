//
//  CartTableViewCell.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/08.
//

import UIKit

protocol CartTableViewCellDelegate {
    func reloadTableView()
}

class CartTableViewCell: UITableViewCell {

    var index: Int = 0
    let cartModel = CartModel()
    var delegate: CartTableViewCellDelegate?
    
    @IBOutlet weak var backgroundUIView: UIView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    @IBOutlet weak var menuCountLabel: UILabel!
    @IBOutlet weak var menuTotalPriceLabel: UILabel!
    @IBOutlet weak var sideMenuTableView: UITableView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundUIView.layer.cornerRadius = 8
        backgroundUIView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func setupUI(_ cellData: CartMenuInfo){
        menuImage.image = cellData.menuImage
        menuNameLabel.text = cellData.menuName
        menuPriceLabel.text = DecimalWon(cellData.menuPrice)
        menuCountLabel.text = String(cellData.menuCtn)
        menuTotalPriceLabel.text = DecimalWon(cellData.menuTotal)
    }
    
    @IBAction func deleteButtonDidTap(_ sender: UIButton) {
        
        if cartModel.count() > 0 {
            cartModel.delete(index)
        }
        
        self.delegate?.reloadTableView()
    }
    
    @IBAction func minusButtonDidTap(_ sender: UIButton) {
        var ctn = cartModel.read(index).menuCtn
        if ctn <= 1 {
            print("ctn is 1")
        } else {
            ctn -= 1
            cartModel.update(index, ctn)
        }
        self.delegate?.reloadTableView()
    }
    
    @IBAction func plusButtonDidTap(_ sender: UIButton) {
        var ctn = cartModel.read(index).menuCtn
        if ctn >= 15 {
            print("ctn is 15")
        } else {
            ctn += 1
            cartModel.update(index, ctn)
        }
        self.delegate?.reloadTableView()

    }
    
}
