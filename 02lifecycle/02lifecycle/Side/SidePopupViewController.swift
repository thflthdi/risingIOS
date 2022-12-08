//
//  SidePopupViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/08.
//

import UIKit

class SidePopupViewController: UIViewController {

    var sideModel = SideMenuModel()
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    var categoryValue = "fried"
    var setSize = "L"
    
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
        let popupVC = storyboard?.instantiateViewController(withIdentifier: "sidePopupVC") as! SidePopupViewController
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.categoryValue = Value.Drink.rawValue
        popupVC.setSize = setSize
        
        //TODO: 선택을 했을 때에만 이동할 수 있도록 수정
        present(popupVC, animated: false)
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
        
    }
    
    
    // 선택하지 않은 메뉴 체크 해제
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! SidePopupCollectionViewCell
        cell.isSelected = false
        cell.setSelected()
        
    }
    
    
}
