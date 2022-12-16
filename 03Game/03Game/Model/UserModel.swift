
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
    static var characterAutoIncrease: [Int] = [0, 0, 0, 0, 0]
}
