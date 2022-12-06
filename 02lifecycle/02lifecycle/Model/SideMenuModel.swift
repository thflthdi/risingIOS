//
//  SideMenuModel.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/07.
//

import Foundation
import UIKit

enum value {
    case fried
    case drink
}

struct sideMenuInfo {
    var name: String
    var price: Int
    var image: UIImage
    var value: String
}

class SideMenuModel {
    private var sideMenuArray: Array<sideMenuInfo> = [
        sideMenuInfo(name:"프렌치프라이L", price: 0, image: UIImage(named: "bulgogi")!, value: "fried"),
        sideMenuInfo(name:"프렌치프라이L", price: 0, image: UIImage(named: "bulgogi")!, value: "fried"),
        sideMenuInfo(name:"프렌치프라이L", price: 0, image: UIImage(named: "bulgogi")!, value: "fried"),
        sideMenuInfo(name:"프렌치프라이L", price: 500, image: UIImage(named: "bulgogi")!, value: "fried"),
        sideMenuInfo(name:"프렌치프라이L", price: 0, image: UIImage(named: "bulgogi")!, value: "drink"),
    ]
    
    var count: Int {
        sideMenuArray.count
    }
    
    public func read(at: Int) -> sideMenuInfo {
        return sideMenuArray[at]
    }
}
