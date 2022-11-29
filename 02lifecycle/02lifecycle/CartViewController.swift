//
//  CartViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/11/29.
//

import UIKit

class CartViewController: UIViewController {
    
    var menuTag = 0
    var price = 0
    var menuCtn = 0
    
    @IBOutlet weak var burgerUIImage: UIImageView!
    @IBOutlet weak var nameUILabel: UILabel!
    @IBOutlet weak var priceUILabel: UILabel!
    @IBOutlet weak var miniTotalUILabel: UILabel!
    @IBOutlet weak var totalUILabel: UILabel!
    @IBOutlet weak var menuCtnLabel: UILabel!
    @IBOutlet weak var menuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let info = appDelegate.menuArray[menuTag]
        
        appDelegate.menuCtnArray[menuTag] += 1
        
        self.burgerUIImage.image = info.imageAdd
        self.nameUILabel.text = info.name
        self.priceUILabel.text = DecimalWon(info.price)
        self.menuCtnLabel.text = String(appDelegate.menuCtnArray[menuTag])
        
        let totalPrice = info.price * appDelegate.menuCtnArray[menuTag]
        price = info.price
        menuCtn = appDelegate.menuCtnArray[menuTag]
        
        self.miniTotalUILabel.text = DecimalWon(totalPrice)
        self.totalUILabel.text = DecimalWon(totalPrice)
    }

    @IBAction func minusBtn(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        menuCtn -= 1
        if menuCtn <= 0 {
            menuCtn = 1
        }
        let totalPrice = price * menuCtn
        self.miniTotalUILabel.text = DecimalWon(totalPrice)
        self.totalUILabel.text = DecimalWon(totalPrice)
        self.menuCtnLabel.text = String(menuCtn)
        
        appDelegate.menuCtnArray[menuTag] = menuCtn
    }
    
    @IBAction func plusBtn(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        menuCtn += 1
        if menuCtn > 15 {
            menuCtn = 15
        }
        let totalPrice = price * menuCtn
        self.miniTotalUILabel.text = DecimalWon(totalPrice)
        self.totalUILabel.text = DecimalWon(totalPrice)
        self.menuCtnLabel.text = String(menuCtn)
        
        appDelegate.menuCtnArray[menuTag] = menuCtn
    }
    
    @IBAction func delBtnDidTap(_ sender: UIButton) {
        self.menuView.isHidden = true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.menuCtnArray[menuTag] = 0
    }
    
    func DecimalWon(_ value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
            
            return result
        }
    
    @IBAction func redirectHomeBtn(_ sender: UIButton) {
        let mainVC = storyboard?.instantiateViewController(withIdentifier: "mainVC") as! ViewController
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}
