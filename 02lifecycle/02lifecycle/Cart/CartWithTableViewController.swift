//
//  CartWithTableViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/08.
//

import UIKit

class CartWithTableViewController: UIViewController {
    
    var cartModel = CartModel()
    var cartList: [setInfo] = []
    var isChecked = false

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalMenuCountLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "딜리버리 카트"
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        
        //마지막 cell이 하단 바에 가려져서 하단에 버퍼 추가
        cartTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        
        for cartItem in cartList {
            CartModel.cartList.append(CartMenuInfo(menuImage: cartItem.setImage, menuName: cartItem.setName, menuPrice: cartItem.setPrice, menuCtn: 1, menuTotal: cartItem.setPrice))
        }
        
        self.totalMenuCountLabel.text = "삭제" + String(cartModel.isCheckedCount())
        self.totalPriceLabel.text = DecimalWon(cartModel.totalPrice())
    }
    
    @IBAction func totalCheckButtonDidTap(_ sender: UIButton) {
        let checkimage = UIImage(systemName: "checkmark.square.fill")
        let uncheckimage = UIImage(systemName: "square")

        if self.isChecked {
            self.checkButton.setImage(checkimage, for: .normal)
            cartModel.isCheckedAllUpdate(true)
            self.isChecked = false
        } else {
            self.checkButton.setImage(uncheckimage, for: .normal)
            cartModel.isCheckedAllUpdate(false)
            self.isChecked = true
        }
        reloadTableView()
        
    }
    
    @IBAction func deleteButtonDidTap(_ sender: UIButton) {
        cartModel.deleteAll()
        reloadTableView()
    }
    
}

//MARK: - Extension
extension CartWithTableViewController: UITableViewDelegate, UITableViewDataSource, CartTableViewCellDelegate {
    
    func reloadTableView() {
        self.cartTableView.reloadData()
        self.totalMenuCountLabel.text = "삭제" + String(cartModel.isCheckedCount())
        self.totalPriceLabel.text = DecimalWon(cartModel.totalPrice())
        print(#function)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cartModel.count()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.setupUI(cartModel.read(indexPath.section))
        cell.index = indexPath.section
        
        cell.prepareCheck(indexPath.section)
        
        cell.delegate = self
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    
    
}
