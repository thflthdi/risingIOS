//
//  SidePopupViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/08.
//

import UIKit

protocol SidePopupViewControllerDelegate: AnyObject {
    func passData(_ cartList: [setInfo],_ friedList: [sideMenuInfo],_ drinkList: [sideMenuInfo])
}

class SidePopupViewController: UIViewController {

    weak var delegate: SidePopupViewControllerDelegate?
    var sideModel = SideMenuModel()
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    var categoryValue = "fried"
    var setSize = "L"
    var cartList: [setInfo] = []
    var friedList: [sideMenuInfo] = []
    var drinkList: [sideMenuInfo] = []
    var dumpList: [sideMenuInfo] = []
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sideCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideCollectionView.delegate = self
        self.sideCollectionView.dataSource = self
        self.sideCollectionView.register(UINib(nibName: "SidePopupCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        //FIXME: 이전 팝업말고 detailOrder페이지로 이동해야됨
        dismiss(animated: false)
    }
    
    @IBAction func submitButtonDidTap(_ sender: UIButton) {

        switch categoryValue {
        
        case Value.Fried.rawValue:
            if dumpList.isEmpty {
                print("메뉴를 선택해 주세요")
            }else {
                self.categoryValue = Value.Drink.rawValue
                self.friedList.append(self.dumpList.popLast()!)
                dumpList.removeAll()
                self.sideCollectionView.reloadData()
            }
            
        case Value.Drink.rawValue:
            if dumpList.isEmpty {
                print("메뉴를 선택해 주세요")
            }else {
                self.drinkList.append(self.dumpList.popLast()!)
                dumpList.removeAll()
                delegate?.passData(self.cartList, self.friedList, self.drinkList)
                self.dismiss(animated: false)
            }
        default:
            print("error")
        }
    }
}

extension SidePopupViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sideModel.count(enumValue: categoryValue, size: setSize)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SidePopupCollectionViewCell
        cell.setupUI(sideModel.read(at: indexPath.row, size: setSize ,cate: categoryValue ))
                
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let width = collectionView.frame.width
            let height = collectionView.frame.height
            let itemsPerRow: CGFloat = 3
            let widthPadding = sectionInsets.left * (itemsPerRow + 1)
            let itemsPerColumn: CGFloat = 2
            let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
            let cellWidth = (width - widthPadding) / itemsPerRow
            let cellHeight = (height - heightPadding) / itemsPerColumn
            
            return CGSize(width: cellWidth, height: cellHeight)
            
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
        return sectionInsets.left
    }
    
    
    // 메뉴 체크 표시
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! SidePopupCollectionViewCell
        cell.isSelected = true
        cell.setSelected()
        
        switch categoryValue {
        case Value.Fried.rawValue:
            if cell.isSelected {
                dumpList.append(sideModel.read(at: indexPath.row, size: setSize ,cate: categoryValue ))
            }
        case Value.Drink.rawValue:
            if cell.isSelected {
                dumpList.append(sideModel.read(at: indexPath.row, size: setSize ,cate: categoryValue ))

            }
        default:
            print("error - cellforitemat")
        }
    }
    
    
    // 선택하지 않은 메뉴 체크 해제
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! SidePopupCollectionViewCell
        cell.isSelected = false
        cell.setSelected()
        
    }
    
    
}
