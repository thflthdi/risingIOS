//
//  OrderDetailViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/07.
//

import UIKit

//TODO: 여기에 정의해도 될까? 좋은 방법
struct setInfo {
    var setName: String
    var setPrice: Int
    var setImage: UIImage
}

class OrderDetailViewController: UIViewController {

    var cellIndex: Int = 0
    
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuDescLabel: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var setListTableView: UITableView!
    private let menuModel = MenuModel()
    private var setList: [setInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setListTableView.delegate = self
        setListTableView.dataSource = self
        setListTableView.register(UINib(nibName: "OrderDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderDetailTableViewCell")
        
        let menu = menuModel.read(at: cellIndex)
        self.title = menu.name
        self.menuNameLabel.text = menu.name
        self.menuDescLabel.text = menu.description
        self.menuImage.image = menu.imageAdd
        setGenerator(menu)
    }
    
    func setGenerator(_ info: burgerInfo) {
        var setName: String
        var setPrice: Int
        //        var setImage: UIImage
        
        setName = info.name + " 라지세트"
        setPrice = info.price + 2000
        setList.append(setInfo(setName: setName, setPrice: setPrice, setImage: info.imageAdd))
        
        setName = info.name + " 세트"
        setPrice = info.price + 1300
        setList.append(setInfo(setName: setName, setPrice: setPrice, setImage: info.imageAdd))
        
        setList.append(setInfo(setName: info.name, setPrice: info.price, setImage: info.imageAdd))
        
    }

}

extension OrderDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return setList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailTableViewCell", for: indexPath) as! OrderDetailTableViewCell
        
        let cellData = setList[indexPath.section]
        cell.setupUI(cellData)
        
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

}
