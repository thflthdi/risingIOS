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
    
    @IBOutlet weak var WatchingHorizScrollView: UIScrollView!
    
    @IBOutlet weak var NgameHorizScrollView: UIScrollView!
    
    @IBOutlet weak var OnlyNHorizScrollView: UIScrollView!
    
    @IBOutlet weak var MyHorizScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //스크롤바 숨김
        MainVerticalScrollView.showsVerticalScrollIndicator = false
        KRHorizScrollView.showsHorizontalScrollIndicator = false
        WatchingHorizScrollView.showsHorizontalScrollIndicator = false
        NgameHorizScrollView.showsHorizontalScrollIndicator = false
        OnlyNHorizScrollView.showsHorizontalScrollIndicator = false
        MyHorizScrollView.showsHorizontalScrollIndicator = false
    }
    

}

//extension UIView {
//    func setGradient(color1:UIColor, color2:UIColor){
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.colors = [color1.cgColor, color2.cgColor]
//        gradient.locations = [0.8 , 1.0]
//                gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
//                gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
//                gradient.frame = bounds
//                layer.addSublayer(gradient)
//    }
//}
