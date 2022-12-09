//
//  OrderViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/06.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var orderTableView: UITableView!
    
    @IBOutlet weak var orderCollectionVew: UICollectionView!
    
    private let menuModel = MenuModel()
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.title = "딜리버리 메뉴"
    }
    
    private func setupTableView(){
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        
//        orderCollectionVew.delegate = self
//        orderCollectionVew.dataSource = self
        
    }

}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        
        let row = indexPath.row
        let cellData = menuModel.read(at: row)
        cell.setupUI(cellData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let orderDetailVC = storyboard?.instantiateViewController(withIdentifier: "orderDetailVC") as! OrderDetailViewController
        orderDetailVC.cellIndex = index
        self.navigationController?.pushViewController(orderDetailVC, animated: true) 
    }
}

//extension OrderViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 8
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "orderCC", for: indexPath) as! OrderCollectionViewCell
//
//        cell.setupUI(menuModel.cateRead(at: indexPath.row))
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "orderCC", for: indexPath) as! OrderCollectionViewCell
//        let item = menuModel.cateRead(at: indexPath.row)
//        let itemSize = item.size(withAttributes: [
//                    NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)
//                ])
//            let width = collectionView.frame.width
//            let height = collectionView.frame.height
//            let itemsPerRow: CGFloat = 4
//            let widthPadding = sectionInsets.left * (itemsPerRow + 1)
//            let itemsPerColumn: CGFloat = 2
//            let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
//            let cellWidth = (width - widthPadding) / itemsPerRow
//            let cellHeight = (height - heightPadding) / itemsPerColumn
//
////            let width = itemSize - cellWidth
//            return CGSize(width: cellWidth, height: cellHeight)
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return sectionInsets
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        return sectionInsets.left
//    }
//}
