//
//  UpgradeViewController.swift
//  03MyGame
//
//  Created by 황예진 on 2022/12/14.
//

import UIKit


class UpgradeViewController: ViewController {

    var getCharacterId: Int = 0
    var robotList = RobotModel()
    var isMax = false
    
    @IBOutlet weak var upgradeSetView: UIView!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelInfoLabel: UILabel!
    
    @IBOutlet weak var progressTab: UIProgressView!
    @IBOutlet weak var nextLevelLabel: UILabel!
    @IBOutlet weak var remainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let presentLevelInfo = robotList.getRobotLevelInfo(id: getCharacterId, userLv: UserModel.characterLevel[getCharacterId])
        
//        UserModel.characterPer[getCharacterId] += presentLevelInfo.increaseGift
        if UserModel.count >= presentLevelInfo.totalGift {
            
            UserModel.count -= presentLevelInfo.totalGift
            
            self.progressTab.progress = Float(UserModel.characterPer[getCharacterId]) / Float(presentLevelInfo.totalGift)
            self.remainLabel.text = String(UserModel.characterPer[getCharacterId]) + "/" + String(presentLevelInfo.totalGift)
            
            if UserModel.characterPer[getCharacterId] >= presentLevelInfo.totalGift {
                if UserModel.characterLevel[getCharacterId] + 1 >= robotList.read(at: getCharacterId).limitLevel{
                    UserModel.characterLevel[getCharacterId] = robotList.read(at: getCharacterId).limitLevel
                    isMax = true
                }else{
                    UserModel.characterPer[getCharacterId] = 0
                    UserModel.characterLevel[getCharacterId] += 1
                }
            }
            setUI()

        }
}
    
    func setUI() {
        let presentLevelInfo = robotList.getRobotLevelInfo(id: getCharacterId, userLv: UserModel.characterLevel[getCharacterId])
        let userPer = UserModel.characterPer[getCharacterId]
        
        self.progressTab.transform = CGAffineTransformMakeScale(1.0, 1.0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        self.progressTab.addGestureRecognizer(tapGesture)
        
        self.characterImage.image = robotList.read(at: getCharacterId).image
        self.levelLabel.text = "Lv."+String(UserModel.characterLevel[getCharacterId])
        self.levelInfoLabel.text = "+ " + String(presentLevelInfo.increaseGift)+" /탭"
        if isMax{
            self.progressTab.progress = 1
            self.nextLevelLabel.text = "Lv.Max"
            self.remainLabel.text = "0/0"
        } else {
            self.progressTab.progress = Float(userPer) / Float(presentLevelInfo.totalGift)
            self.nextLevelLabel.text = "Lv." + String(UserModel.characterLevel[getCharacterId] + 1)
            self.remainLabel.text = String(userPer) + "/" + String(presentLevelInfo.totalGift)
        }
        

    }
}
