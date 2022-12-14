//
//  UserModel.swift
//  03MyGame
//
//  Created by 황예진 on 2022/12/15.
//

import Foundation

struct User {
    var userTapPlusGift: Int
    var characterLevel: [Int]
    var characterPer: [Int]
}

class UserModel {
    static var count: Int = 0
    static var userTapPlusGift: Int = 1
    static var characterLevel: [Int] = [1, 0, 0, 0, 0]
    static var characterPer: [Int] = [0, 0, 0, 0, 0]
}
