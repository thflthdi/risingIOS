//
//  UITabBarViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/11/27.
//

import UIKit

class UITabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //그림자
        setupStyle()
        
        self.tabBar.unselectedItemTintColor = UIColor(red: 0.32, green: 0.14, blue: 0.08, alpha: 1)
        self.tabBar.backgroundColor = UIColor(red: 0.96, green: 0.92, blue: 0.86, alpha: 1)
        
//        viewControllers![2].tabBarItem.selectedImage = UIImage(systemName: "xmark")
    }
    
    func setupStyle() {
        UITabBar.clearShadow()
        self.tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 50)
    }


}

extension CALayer {
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
    
}

extension UITabBar {
    //기본 그림자스타일을 초기화 해야 커스텀 스타일을 적용할수 있다.
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
