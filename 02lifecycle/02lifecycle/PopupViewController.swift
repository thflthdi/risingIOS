//
//  PopupViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/11/30.
//

import UIKit

class PopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
}
