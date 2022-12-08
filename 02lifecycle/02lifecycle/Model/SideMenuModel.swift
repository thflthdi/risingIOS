//
//  SideMenuModel.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/07.
//

import Foundation
import UIKit

//MARK: - ENUM
enum Value: String {
    case Fried = "fried"
    case Drink = "drink"
}

enum Size: String {
    case Large = "L"
    case Regular = "R"
    case Single = "S"
}

//MARK: - Struct
struct sideMenuInfo {
    var name: String
    var price: Int
    var image: UIImage
    var value: String
    var size: String
}

class SideMenuModel {
    
    //MARK: - Data
    //size: L
    private var sideMenuLArray: Array<sideMenuInfo> = [
        sideMenuInfo(name:"프렌치프라이L", price: 0, image: UIImage(named: "bulgogi")!, value: "fried", size: "L"),
    ]
    
    private var sideDrinkLArray: Array<sideMenuInfo> = [
        sideMenuInfo(name:"콜라L", price: 0, image: UIImage(named: "bulgogi")!, value: "drink", size: "L"),
    ]

    
    //size: R
    private var sideMenuRArray: Array<sideMenuInfo> = [
        sideMenuInfo(name:"프렌치프라이L", price: 500, image: UIImage(named: "bulgogi")!, value: "fried", size: "R"),
        sideMenuInfo(name:"프렌치프라이R", price: 0, image: UIImage(named: "bulgogi")!, value: "fried", size: "R"),
    ]
    
    private var sideDrinkRArray: Array<sideMenuInfo> = [
        sideMenuInfo(name:"콜라L", price: 200, image: UIImage(named: "bulgogi")!, value: "drink", size: "R"),
    ]
    
    
    //MARK: - CRUD
    public func count(enumValue: String, size: String) -> Int {
        let sidemenuArray = chooseList(category: enumValue, size: size)
        return sidemenuArray.count
    }
    
    public func read(at: Int, size: String, cate: String) -> sideMenuInfo {
        let sidemenuArray = chooseList(category: cate, size: size)
        return sidemenuArray[at]
    }
    
    
    //MARK: - ETC
    private func chooseList(category: String, size: String) -> Array<sideMenuInfo>{
        var menuArr: [sideMenuInfo]
        
        switch category {
            
            case Value.Fried.rawValue:
                switch size {
                    case Size.Large.rawValue:
                        menuArr = sideMenuLArray
                    case Size.Regular.rawValue:
                        menuArr = sideMenuRArray
                    default:
                        menuArr = []
                }
            
            case Value.Drink.rawValue:
                switch size {
                    case Size.Large.rawValue:
                        menuArr = sideDrinkLArray
                    case Size.Regular.rawValue:
                        menuArr = sideDrinkRArray
                    default:
                        menuArr = []
                }
            
        default:
            menuArr = []
        }
        
        return menuArr
    }
}
