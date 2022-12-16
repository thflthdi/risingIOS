import Foundation
import UIKit

struct RobotInfo {
    var id: Int
    var image: UIImage
    var price: Int
    var limitLevel: Int
    var interval: Double
}

struct RobotLevelInfo {
    var level: Int
    var totalGift: Int
    var increaseGift: Int
    var robotId: Int
}

class RobotModel {
    var RobotInfoList: [RobotInfo] = [
        RobotInfo(id: 0, image: UIImage(named: "mainCha")!, price: 0, limitLevel: 5, interval: 0),
        RobotInfo(id: 1, image: UIImage(named:"cycleMan")!, price: 100, limitLevel: 5, interval: 5),
        RobotInfo(id: 2, image: UIImage(named:"green")!, price: 1000, limitLevel: 5, interval: 10),
        RobotInfo(id: 3, image: UIImage(named:"blue")!, price: 90000, limitLevel: 5, interval: 15),
        RobotInfo(id: 4, image: UIImage(named:"yellow")!, price: 999999, limitLevel: 5, interval: 20)]
    
    var mainChaAniImages: [UIImage] = [
        UIImage(named: "main0")!,UIImage(named: "main1")!,UIImage(named: "main2")!,
        UIImage(named: "main3")!,UIImage(named: "main4")!,UIImage(named: "main5")!,
        UIImage(named: "main6")!,UIImage(named: "main7")!,UIImage(named: "main8")!,
        UIImage(named: "main9")!,UIImage(named: "main10")!,UIImage(named: "main11")!,
    ]
    var cycleManImages: [UIImage] = [
        UIImage(named: "Foozlecc_Robot_Run_1")!,UIImage(named: "Foozlecc_Robot_Run_2")!,
        UIImage(named: "Foozlecc_Robot_Run_3")!,UIImage(named: "Foozlecc_Robot_Run_4")!,
        UIImage(named: "Foozlecc_Robot_Run_5")!,UIImage(named: "Foozlecc_Robot_Run_6")!,
        UIImage(named: "Foozlecc_Robot_Run_7")!,UIImage(named: "Foozlecc_Robot_Run_8")!,
        UIImage(named: "Foozlecc_Robot_Run_9")!,UIImage(named: "Foozlecc_Robot_Run_10")!,
        UIImage(named: "Foozlecc_Robot_Run_11")!,
    ]
    var greenImages: [UIImage] = [
        UIImage(named: "green0")!,UIImage(named: "green1")!,UIImage(named: "green2")!,UIImage(named: "green3")!,
        UIImage(named: "green4")!,UIImage(named: "green5")!,UIImage(named: "green6")!,UIImage(named: "green7")!,
        UIImage(named: "green8")!,UIImage(named: "green9")!,UIImage(named: "green10")!,UIImage(named: "green11")!,
        UIImage(named: "green12")!,UIImage(named: "green13")!,UIImage(named: "green14")!,UIImage(named: "green15")!,
        UIImage(named: "green16")!,UIImage(named: "green17")!,
    ]
    
    
    var RobotLevelList: [RobotLevelInfo] = [
        RobotLevelInfo(level: 1, totalGift: 10, increaseGift: 1, robotId: 0),
        RobotLevelInfo(level: 2, totalGift: 100, increaseGift: 5, robotId: 0),
        RobotLevelInfo(level: 3, totalGift: 300, increaseGift: 10, robotId: 0),
        RobotLevelInfo(level: 4, totalGift: 500, increaseGift: 15, robotId: 0),
        RobotLevelInfo(level: 5, totalGift: 700, increaseGift: 20, robotId: 0),
        
        RobotLevelInfo(level: 1, totalGift: 100, increaseGift: 30, robotId: 1),
        RobotLevelInfo(level: 2, totalGift: 1000, increaseGift: 60, robotId: 1),
        RobotLevelInfo(level: 3, totalGift: 10000, increaseGift: 90, robotId: 1),
        RobotLevelInfo(level: 4, totalGift: 100000, increaseGift: 120, robotId: 1),
        RobotLevelInfo(level: 5, totalGift: 1000000, increaseGift: 240, robotId: 1),

        RobotLevelInfo(level: 1, totalGift: 500, increaseGift: 100, robotId: 2),
        RobotLevelInfo(level: 2, totalGift: 5000, increaseGift: 300, robotId: 2),
        RobotLevelInfo(level: 3, totalGift: 50000, increaseGift: 600, robotId: 2),
        RobotLevelInfo(level: 4, totalGift: 500000, increaseGift: 1200, robotId: 2),
        RobotLevelInfo(level: 5, totalGift: 5000000, increaseGift: 2400, robotId: 2),

        RobotLevelInfo(level: 1, totalGift: 10, increaseGift: 1, robotId: 3),
        RobotLevelInfo(level: 2, totalGift: 10, increaseGift: 2, robotId: 3),
        RobotLevelInfo(level: 3, totalGift: 10, increaseGift: 3, robotId: 3),
        RobotLevelInfo(level: 4, totalGift: 10, increaseGift: 4, robotId: 3),
        RobotLevelInfo(level: 5, totalGift: 10, increaseGift: 5, robotId: 3),

        RobotLevelInfo(level: 1, totalGift: 10, increaseGift: 1, robotId: 4),
        RobotLevelInfo(level: 2, totalGift: 10, increaseGift: 2, robotId: 4),
        RobotLevelInfo(level: 3, totalGift: 10, increaseGift: 3, robotId: 4),
        RobotLevelInfo(level: 4, totalGift: 10, increaseGift: 4, robotId: 4),
        RobotLevelInfo(level: 5, totalGift: 10, increaseGift: 5, robotId: 4),

    ]
    
    public func count() -> Int {
        return RobotInfoList.count
    }
    
    public func read(at: Int) -> RobotInfo {
        return RobotInfoList[at]
    }
    
    public func getRobotLevelInfo(id: Int, userLv: Int) -> RobotLevelInfo {
        if userLv != 0 {
            let list = RobotLevelList.filter { robot in
                robot.level == userLv && robot.robotId == id
            }
            return list[0]
        } else {
            return RobotLevelInfo(level: 0, totalGift: 0, increaseGift: 0, robotId: 0)
        }
        
    }
}
