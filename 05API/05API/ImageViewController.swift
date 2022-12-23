//
//  ImageViewController.swift
//  05API
//
//  Created by 황예진 on 2022/12/23.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageTableView: UITableView!
    var weatherClothesModel = WeatherClothesModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageTableView.delegate = self
        self.imageTableView.dataSource = self
    }
    
    func reloadData() {
        self.imageTableView.reloadData()
    }
}

extension ImageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
        cell.setupImage(weatherClothesModel.getImage(indexPath.row, TempInfoModel.temp))
        
        // 테스트 데이터
//        cell.setupImage(weatherClothesModel.getImage(indexPath.row, -1))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
    
}
