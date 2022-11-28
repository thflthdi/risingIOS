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
        let mainVC = storyboard?.instantiateViewController(withIdentifier: "mainVC") as! ViewController
//
//        mainVC.delegate = self
        let info = mainVC.menuArray[menuTag - 1]
        self.burgerImageView.image = info.imageAdd
        self.titleUILabel.text = info.name
        self.descriptionUILabel.text = info.description
    }
    
}

//extension DetailViewController: DetailViewControllerDelegate{
//    func passData(_ info: burgerInfo) {
//        print("ok")
//        self.burgerImageView.image = info.imageAdd
//        self.titleUILabel.text = info.name
//        self.descriptionUILabel.text = info.description
//    }
//}
