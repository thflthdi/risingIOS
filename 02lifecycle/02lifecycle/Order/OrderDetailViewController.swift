//
//  OrderDetailViewController.swift
//  02lifecycle
//
//  Created by 황예진 on 2022/12/07.
//

import UIKit

//???: 여기에 정의해도 될까? 좋은 방법
struct setInfo {
    var setName: String
    var setPrice: Int
    var setImage: UIImage
    var size: String
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
    
    // 버거세트 생성기 - 3종류 고정
    // TODO: cartModel 생성해서 Update로 데이터 넣을 것
    func setGenerator(_ info: burgerInfo) {
        var setName: String
        var setPrice: Int
        //        var setImage: UIImage
        
        setName = info.name + " 라지세트"
        setPrice = info.price + 2000
        setList.append(setInfo(setName: setName, setPrice: setPrice, setImage: info.imageAdd, size: "L"))
        
        setName = info.name + " 세트"
        setPrice = info.price + 1300
        setList.append(setInfo(setName: setName, setPrice: setPrice, setImage: info.imageAdd, size: "R"))
        
        setList.append(setInfo(setName: info.name, setPrice: info.price, setImage: info.imageAdd, size: "S"))
        
    }
    
}

//MARK: - Extension
extension OrderDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    // cell간 spacing 조절을 위해 raw는 1개, section을 여러개로 둠
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 따라서, section의 갯수를 세야함
    func numberOfSections(in tableView: UITableView) -> Int {
        return setList.count
    }
    
    //???: 이부분 공부해야됨
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let popupVC = storyboard?.instantiateViewController(withIdentifier: "sidePopupVC") as! SidePopupViewController
        popupVC.modalPresentationStyle = .overFullScreen
        let menu = setList[indexPath.section]
        
        // single 사이즈는 사이드를 선택하지 않고 바로 장바구니로 이동함.
        if menu.size != Size.Single.rawValue {
            popupVC.categoryValue = Value.Fried.rawValue
            popupVC.setSize = menu.size
            present(popupVC, animated: false)
        }
        else {
            //TODO: 장바구니로 push
        }
    }
    
    
}
