//
//  ViewController.swift
//  01autolayout
//
//  Created by 황예진 on 2022/11/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MainVerticalScrollView: UIScrollView!
    
    @IBOutlet weak var KRHorizScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainVerticalScrollView.showsVerticalScrollIndicator = false
        KRHorizScrollView.showsHorizontalScrollIndicator = false
    }


}

