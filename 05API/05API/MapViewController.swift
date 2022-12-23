//
//  MapViewController.swift
//  05API
//
//  Created by 황예진 on 2022/12/23.
//

import UIKit

protocol MapViewControllerDelegate: AnyObject{
    func endSearch(_ x: String,_ y: String)
}

class MapViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var searchResultTableView: UITableView!
    
    var count = 0
    var searchList: [searchItem] = []
    var selectIndex = 0
    
    weak var delegate: MapViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        
    }
    
    @IBAction func didTapSubmitBtn(_ sender: UIButton) {
        GeoRequest().search(self, inputTextField.text ?? "")
    }
    
    
}

extension MapViewController {
    func didSearchSuccess(_ response: SearchResponse){
        let result = response.response
        self.count = Int(result.record.current) ?? 0
        self.searchList = result.result.items
        
        self.searchResultTableView.reloadData()
    }
}

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell", for: indexPath) as! MapTableViewCell
        cell.setupUI(searchList[indexPath.row].address)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = searchList[indexPath.row].point
        self.delegate?.endSearch(result.x, result.y)
        self.navigationController?.popViewController(animated: true)
    }
}
