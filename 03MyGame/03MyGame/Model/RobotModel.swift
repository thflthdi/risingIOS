//
//  RobotModel.swift
//  03MyGame
//
//  Created by 황예진 on 2022/12/14.
//

import Foundation
import UIKit

struct RobotInfo {
    var id: Int
    var image: UIImage
    var price: Int
    var limitLevel: Int
}

struct RobotLevelInfo {
    var level: Int
    var totalGift: Int
    var increaseGift: Int
    var robotId: Int
}

class RobotModel {
    var RobotInfoList: [RobotInfo] = [
        RobotInfo(id: 0, image: UIImage(named: "mainCha")!, price: 0, limitLevel: 5),
        RobotInfo(id: 1, image: UIImage(named:"cycleMan")!, price: 10, limitLevel: 5),
        RobotInfo(id: 2, image: UIImage(named:"green")!, price: 10, limitLevel: 5),
        RobotInfo(id: 3, image: UIImage(named:"blue")!, price: 10, limitLevel: 5),
        RobotInfo(id: 4, image: UIImage(named:"yellow")!, price: 10, limitLevel: 5)]
    
    
    var RobotLevelList: [RobotLevelInfo] = [
        RobotLevelInfo(level: 1, totalGift: 10, increaseGift: 1, robotId: 0),
        RobotLevelInfo(level: 2, totalGift: 10, increaseGift: 2, robotId: 0),
        RobotLevelInfo(level: 3, totalGift: 10, increaseGift: 3, robotId: 0),
        RobotLevelInfo(level: 4, totalGift: 10, increaseGift: 4, robotId: 0),
        RobotLevelInfo(level: 5, totalGift: 10, increaseGift: 5, robotId: 0),
    ]
    
    public func count() -> Int {
        return RobotInfoList.count
    }
    
    public func read(at: Int) -> RobotInfo {
        return RobotInfoList[at]
    }
    
    public func getRobotLevelInfo(id: Int, userLv: Int) -> RobotLevelInfo {
        let list = RobotLevelList.filter { robot in
            robot.level == userLv && robot.robotId == id
        }
        return list[0]
    }
}

