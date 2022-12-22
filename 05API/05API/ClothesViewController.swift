//
//  ClothesViewController.swift
//  05API
//
//  Created by 황예진 on 2022/12/23.
//

import UIKit

class ClothesViewController: UIViewController {
    @IBOutlet weak var clothesTableView: UITableView!
    let weatherClothesModel = WeatherClothesModel()
    var hasData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clothesTableView.dataSource = self
        self.clothesTableView.delegate = self
    }
    
    func reloadData() {
        hasData = true
        self.clothesTableView.reloadData()
    }

}

// MARK: UITableView
extension ClothesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if hasData {
            return weatherClothesModel.count(TempInfoModel.temp)
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clothesCell", for: indexPath) as! ClothesTableViewCell
        cell.setupUI(weatherClothesModel.read(indexPath.row, TempInfoModel.temp))
        return cell
    }
    
}
