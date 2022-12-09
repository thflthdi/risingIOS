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
        sideMenuInfo(name:"프렌치프라이L", price: 0, image: UIImage(named: "fri")!, value: "fried", size: "L"),
        sideMenuInfo(name:"앵그리너겟킹 4조각 교환", price: 300, image: UIImage(named: "angry")!, value: "fried", size: "L"),
        sideMenuInfo(name:"너겟킹 4조각 교환", price: 300, image: UIImage(named: "nerget")!, value: "fried", size: "L"),
        sideMenuInfo(name:"치즈프라이 교환", price: 400, image: UIImage(named: "cheese")!, value: "fried", size: "L"),
    ]
    
    private var sideDrinkLArray: Array<sideMenuInfo> = [
        sideMenuInfo(name:"콜라L", price: 0, image: UIImage(named: "coka")!, value: "drink", size: "L"),
        sideMenuInfo(name:"코카콜라 제로L 교환", price: 0, image: UIImage(named: "zero")!, value: "drink", size: "L"),
        sideMenuInfo(name:"스프라이트L 교환", price: 0, image: UIImage(named: "sprite")!, value: "drink", size: "L"),
        sideMenuInfo(name:"씨그램L 교환", price: 0, image: UIImage(named: "se")!, value: "drink", size: "L"),
        sideMenuInfo(name:"미닛메이드 오렌지 교환", price: 600, image: UIImage(named: "oran")!, value: "drink", size: "L"),
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
