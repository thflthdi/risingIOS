//
//  CartTableViewCell.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/08.
//

import UIKit

protocol CartTableViewCellDelegate: AnyObject {
    func reloadTableView()
}

class CartTableViewCell: UITableViewCell {

    var index: Int = 0
    let cartModel = CartModel()
    weak var delegate: CartTableViewCellDelegate?
    
    @IBOutlet weak var backgroundUIView: UIView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    @IBOutlet weak var menuCountLabel: UILabel!
    @IBOutlet weak var menuTotalPriceLabel: UILabel!
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var checkButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundUIView.layer.cornerRadius = 8
        backgroundUIView.layer.masksToBounds = true
        
//        sideMenuTableView.delegate = self
//        sideMenuTableView.dataSource = self
//        sideMenuTableView.register(UINib(nibName: "sideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "sideMenuTableViewCell")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        let checkimage = UIImage(systemName: "checkmark.square.fill")
        self.checkButton.setImage(checkimage, for: .normal)
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
    
    @IBAction func checkButtonDidTap(_ sender: UIButton) {
        let checkimage = UIImage(systemName: "checkmark.square.fill")
        let uncheckimage = UIImage(systemName: "square")

        let isChecked = cartModel.isCheckedUpdate(index)
//        print(index, isChecked)
        if isChecked {
            self.checkButton.setImage(checkimage, for: .normal)
        } else {
            self.checkButton.setImage(uncheckimage, for: .normal)
        }
        self.delegate?.reloadTableView()
    }
    
    public func prepareCheck(_ at: Int){
        let checkimage = UIImage(systemName: "checkmark.square.fill")
        let uncheckimage = UIImage(systemName: "square")

        let isChecked = cartModel.isCheckedRead(at)
        if isChecked {
            self.checkButton.setImage(checkimage, for: .normal)
        } else {
            self.checkButton.setImage(uncheckimage, for: .normal)
        }
    }
}

//extension CartTableViewCell: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuTableViewCell", for: indexPath) as! sideMenuTableViewCell
//        return cell
//    }
//    
//    
//}
