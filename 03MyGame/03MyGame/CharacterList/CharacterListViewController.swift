//
//  SkillListViewController.swift
//  03MyGame
//
//  Created by 황예진 on 2022/12/12.
//

import UIKit

private enum CellID: String {
    case CellID = "CharacterListCollectionViewCell"
}

class CharacterListViewController: ViewController {
    
    var robotList = RobotModel()
    
    @IBOutlet weak var characterListCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.characterListCV.delegate = self
        self.characterListCV.dataSource = self
        self.characterListCV.register(UINib(nibName: CellID.CellID.rawValue, bundle: nil), forCellWithReuseIdentifier: CellID.CellID.rawValue)
        
    }
}

extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return robotList.count()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID.CellID.rawValue, for: indexPath) as! CharacterListCollectionViewCell
        
        cell.setupUI(robotList.read(at: indexPath.row))
        if UserModel.characterLevel[indexPath.row] > 0 {
            cell.blindView.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let pwidth = collectionView.frame.width
        let pheight = collectionView.frame.height
        let itemsPerRow: CGFloat = CGFloat(6)
        let cellWidth = pwidth / itemsPerRow
        return CGSize(width: cellWidth, height: pheight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let upgradeVC = storyboard?.instantiateViewController(withIdentifier: "upgradeVC") as! UpgradeViewController
        upgradeVC.getCharacterId = robotList.read(at: indexPath.row).id
    }
    
}
