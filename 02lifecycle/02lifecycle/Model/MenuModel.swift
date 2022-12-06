//
//  MenuModel.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/06.
//

import Foundation
import UIKit

enum Category {
    case special
    case new
    case primium
    case jounior
    case chicken
    case side
    case drink
    case dog
}

struct burgerInfo {
    var index: Int
    var name: String
    var price: Int
    var description: String
    var isChecked: Bool
    var imageAdd: UIImage
    var category: String
}

class MenuModel {
    static let shared = MenuModel()
    private var menuArray: Array<burgerInfo> = [
        burgerInfo(index:1, name:"비프불고기버거", price: 4800, description: "달콤판 불고기소스와 100% 순쇠고기 패티의 감칠맛나는 조화, 비프불고기버거!", isChecked: true, imageAdd: UIImage(named: "bulgogi")!, category: "new"),
        burgerInfo(index:2, name:"골든치즈렐라 X", price: 11500, description: "황금빛 치즈가 통째로! 모짜렐라 치즈와 체다 치즈가 만나 풍미 작렬!", isChecked: true, imageAdd: UIImage(named: "x")!, category: "new"),
        burgerInfo(index:3, name:"골든치즈렐라와퍼", price: 10500, description: "황금빛 치즈가 통째로! 모짜렐라 치즈와 체다 치즈가 만나 풍미 작렬!", isChecked: true, imageAdd: UIImage(named: "whopper")!, category: "new"),
        burgerInfo(index:4, name:"골든치즈렐라치킨버거", price: 9500, description: "황금빛 치즈가 통째로! 모짜렐라 치즈와 체다 치즈가 만나 풍미 작렬!", isChecked: true, imageAdd: UIImage(named: "chicken")!, category: "new"),
        burgerInfo(index:5, name:"골든치즈렐라치킨버거", price: 9500, description: "황금빛 치즈가 통째로! 모짜렐라 치즈와 체다 치즈가 만나 풍미 작렬!", isChecked: true, imageAdd: UIImage(named: "chicken")!, category: "primium"),
        burgerInfo(index:6, name:"골든치즈렐라치킨버거", price: 9500, description: "황금빛 치즈가 통째로! 모짜렐라 치즈와 체다 치즈가 만나 풍미 작렬!", isChecked: true, imageAdd: UIImage(named: "chicken")!, category: "jounior"),
    ]
    
    var count: Int {
        menuArray.count
    }
    
    public func read(at: Int) -> burgerInfo {
        return menuArray[at]
    }
}
