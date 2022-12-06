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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView(){
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
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
}
