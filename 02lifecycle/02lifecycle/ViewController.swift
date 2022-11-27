//
//  ViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/11/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var membershipUIV: UIView!
    @IBOutlet weak var kingorderUIV: UIView!
    @IBOutlet weak var deliveryUIV: UIView!
    
    @IBOutlet weak var barcodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "logo")
            navigationItem.titleView = UIImageView(image: image)
        membershipUIV.layer.cornerRadius = 10
        kingorderUIV.layer.cornerRadius = 10
        deliveryUIV.layer.cornerRadius = 10
        barcodeButton.layer.cornerRadius = barcodeButton.frame.width / 2
        barcodeButton.tintColor = UIColor(red: 0.84, green: 0.14, blue: 0.02, alpha: 1)
        barcodeButton.layer.masksToBounds = true
        
    }


}

