//
//  CartModel.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/08.
//

import Foundation
import UIKit

struct CartMenuInfo {
    var menuImage: UIImage
    var menuName: String
    var menuPrice: Int
    var menuCtn: Int
    var menuTotal: Int
    var isChecked: Bool = true
    var drinkList: [sideMenuInfo] = []
    var friedList: [sideMenuInfo] = []
}

class CartModel {
    //프로그램이 끝날 때 까지 메모리 공간차지
    //어떤 함수에서든지 접근이 가능하기 때문에 멀티 태스킹 환경에서 예기치못한 문제 야기
    //하지만 난 필요 - 실제 협업에서는 서버에서 주는 데이터를 이용하면 되기 때문에 지금만 써보자!
    static var cartList: [CartMenuInfo] = []

    public func count() -> Int {
        return CartModel.cartList.count
    }
    
    public func isCheckedCount() -> Int {
        let filteredList = CartModel.cartList.filter { CartMenuInfo in
            return CartMenuInfo.isChecked
        }
        return filteredList.count
    }
    
    public func totalPrice() -> Int {
        return CartModel.cartList.reduce(0) { partialResult, menu in
            partialResult + (menu.menuCtn * menu.menuPrice)
        }
    }
    
    public func read(_ at: Int) -> CartMenuInfo {
        return CartModel.cartList[at]
    }
    
    public func isCheckedRead(_ at: Int) -> Bool {
        return CartModel.cartList[at].isChecked
    }
    
    public func update(_ at: Int, _ count: Int) {
        CartModel.cartList[at].menuCtn = count
        CartModel.cartList[at].menuTotal = count * CartModel.cartList[at].menuPrice
    }
    
    public func isCheckedUpdate(_ at: Int) -> Bool {
        var ischecked = CartModel.cartList[at].isChecked
        if ischecked {
            CartModel.cartList[at].isChecked = false
            ischecked = false
        }else {
            CartModel.cartList[at].isChecked = true
            ischecked = true
        }
        return ischecked
    }
    
    public func isCheckedAllUpdate(_ ischecked: Bool) {
        for index in 0..<CartModel.cartList.count {
            CartModel.cartList[index].isChecked = ischecked
        }
    }
    
    public func delete(_ at: Int) {
        CartModel.cartList.remove(at: at)
    }
    
    public func deleteAll() {
        CartModel.cartList = CartModel.cartList.filter({ menu in
            menu.isChecked == false
        })
    }
}
