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
}

class CartModel {
    //프로그램이 끝날 때 까지 메모리 공간차지
    //어떤 함수에서든지 접근이 가능하기 때문에 멀티 태스킹 환경에서 예기치못한 문제 야기
    //하지만 난 필요 - 실제 협업에서는 서버에서 주는 데이터를 이용하면 되기 때문에 지금만 써보자!
    static var cartList: [CartMenuInfo] = []

    public func count() -> Int {
        return CartModel.cartList.count
    }
    
    public func read(_ at: Int) -> CartMenuInfo {
        return CartModel.cartList[at]
    }
    
    public func update(_ at: Int, _ count: Int) {
        CartModel.cartList[at].menuCtn = count
        CartModel.cartList[at].menuTotal = count * CartModel.cartList[at].menuPrice
    }
    
    public func delete(_ at: Int) {
        CartModel.cartList.remove(at: at)
    }
}
