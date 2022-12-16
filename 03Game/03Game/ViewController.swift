//
//  ViewController.swift
//  03Game
//
//  Created by 황예진 on 2022/12/16.
//

import UIKit

class ViewController: UIViewController {
    
    private var at: Int = 0
    private var isMax = [false, false, false, false ,false]
    var robotModel = RobotModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = false
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        
        NotificationCenter.default.addObserver(self, selector: #selector(notiTab), name: Notification.Name("tab"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(checkCount), name: Notification.Name("Count"), object: nil)
        
    }

    @objc func notiTab(noti: Notification){
        
        let at = noti.object as! Int
        self.at = at
        
        print("at \(at), \(self.at)")
        self.checkCount()
        collectionView.scrollToItem(at: NSIndexPath(item: at ?? 0, section: 0) as IndexPath, at: .right, animated: true)
    }
    
    @objc func checkCount(){
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,  UpgradeCollectionCellDelegate{
    func buttonTap() {
        let robot = robotModel.read(at: at)
        let levelInfo = robotModel.getRobotLevelInfo(id: at, userLv: UserModel.characterLevel[at])
        
        if !isMax[at] {
            if UserModel.count >= levelInfo.totalGift {
                UserModel.count -= levelInfo.totalGift
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userCount"), object: nil )
                UserModel.characterLevel[at] += 1
                let NewlevelInfo = robotModel.getRobotLevelInfo(id: at, userLv: UserModel.characterLevel[at])
                UserModel.userTapPlusGift = NewlevelInfo.increaseGift
                if at != 0 {
                    UserModel.characterAutoIncrease[at] = NewlevelInfo.increaseGift
                }
            }
        }
        if UserModel.characterLevel[at] == robot.limitLevel {
            isMax[at] = true
        }
//        print(UserModel.characterLevel)
//        print(UserModel.userTapPlusGift)
//        print(UserModel.characterAutoIncrease)
//        print(isMax)
        collectionView.reloadData()
}
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return robotModel.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upgradeCell", for: indexPath) as! UpgradeCollectionCell
        cell.delegate = self
        cell.upgradeBtn.isEnabled = false
        
        let robot = robotModel.read(at: indexPath.row)
        let levelInfo = robotModel.getRobotLevelInfo(id: indexPath.row, userLv: UserModel.characterLevel[indexPath.row])
        
        cell.characterImage.image = robot.image
        cell.levelLabel.text = String("Lv. ") + String(UserModel.characterLevel[indexPath.row])
        if indexPath.row == 0 {
            cell.infoLabel.text = String("+ ") + String(levelInfo.increaseGift) + String(" / 탭")
        } else {
            cell.infoLabel.text = String("+ ") + String(levelInfo.increaseGift) + String(" / ") + String(robot.interval) + String(" 초")

        }

        if UserModel.count >= levelInfo.totalGift {
            cell.upgradeBtn.isEnabled = true
        }
        
        if isMax[indexPath.row]{
            cell.upgradeBtn.setTitle("Lv. Max", for: .normal)
            cell.upgradeBtn.isEnabled = false
        }else{
            cell.upgradeBtn.setTitle(String(levelInfo.totalGift), for: .normal)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.height)
        }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

