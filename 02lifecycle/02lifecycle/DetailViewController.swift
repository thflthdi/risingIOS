//
//  DetailViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/11/29.
//

import UIKit

class DetailViewController: UIViewController {
    
    var menuTag: Int = 0
    
    @IBOutlet weak var burgerImageView: UIImageView!
    @IBOutlet weak var titleUILabel: UILabel!
    @IBOutlet weak var descriptionUILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var info = appDelegate.menuArray[menuTag]
        
        self.burgerImageView.image = info.imageAdd
        self.titleUILabel.text = info.name
        self.descriptionUILabel.text = info.description

    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        let cartVC = storyboard?.instantiateViewController(withIdentifier: "cartVC") as! CartViewController
        cartVC.menuTag = menuTag
        
        self.navigationController?.pushViewController(cartVC, animated: true)
        
    }
}
