//
//  MyNavigationViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/08.
//

import UIKit

class MyNavigationViewController: UINavigationController {

    var brownColor = UIColor(red: 0.32, green: 0.14, blue: 0.08, alpha: 1.00)
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.tintColor = brownColor
        self.navigationBar.barTintColor = UIColor(red: 0.96, green: 0.92, blue: 0.86, alpha: 1.00)
        self.navigationBar.topItem?.title = ""
        self.navigationBar.titleTextAttributes = [.foregroundColor: brownColor]
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)
    }
    
}
