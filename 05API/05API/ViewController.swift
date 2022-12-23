//
//  ViewController.swift
//  05API
//
//  Created by 황예진 on 2022/12/20.
//

import UIKit
import CoreLocation
import Alamofire


class ViewController: UIViewController {
    
    // Type: 앱에서 위치 관련 이벤트 전달을 시작/중지 하는데 사용하는 개체
    var locationManager: CLLocationManager?
    // Type: 위도와 경도를 알려주는 struct
    var currentLocation: CLLocationCoordinate2D!
    var isGetData = false
    
    var PTYList: [Item] = []
    var WSDList: [Item] = []
    var T1HList: [Item] = []
    var SKYList: [Item] = []
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var hourtemperUIView: UIView!
    @IBOutlet weak var dustUIView: UIView!
    @IBOutlet weak var wearUIView: UIView!
    
    @IBOutlet weak var temperCityLabel: UILabel!
    @IBOutlet weak var temperSwitchingLabel: UILabel!
    @IBOutlet weak var temperLabel: UILabel!
    @IBOutlet weak var weatherIconImage: UIImageView!
    
    @IBOutlet weak var temperSixTimeCollectionView: UICollectionView!
    
// MARK: - 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
    
        GeoRequest().getAddress(self)
        
        radiusUIView()
        checkLocationAuth()
        
        self.temperSixTimeCollectionView.delegate = self
        self.temperSixTimeCollectionView.dataSource = self

    }
    
    
// MARK: - function
    
    func radiusUIView() {
        self.hourtemperUIView.clipsToBounds = true
        self.hourtemperUIView.layer.cornerRadius = 10
        self.dustUIView.clipsToBounds = true
        self.dustUIView.layer.cornerRadius = 10
        self.wearUIView.clipsToBounds = true
        self.wearUIView.layer.cornerRadius = 10
    }
    
    // 유저 위치 권한 체크
    func checkLocationAuth() {
        if locationManager == nil {
            
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            
            // 유저 위치 권한 확인 및 상태에 따른 핸들링
            locationManagerDidChangeAuthorization(locationManager!)
        }
    }
    
    // 위치 권한 요청
    func requestToUserForLocation() {
        // 위치 정확도는 대략적으로 잡혀도 상관 없음
        locationManager!.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        // 권한 요청 보냄
        locationManager!.requestWhenInUseAuthorization()
    }

    // 권한 상태값에 따른 분기처리 메서드
    func handleForLocationPermissionStatus(_ authStatus: CLAuthorizationStatus) {
        switch authStatus {
        
        case .notDetermined:
            print("notDetermined")
            // 권한에 대한 설정을 하지 않음
            requestToUserForLocation()
            
        case .denied, .restricted:
            print("denied")
            // 명시적으로 권한 거부, 위치 서비스 활성화 제한 상태
            // 시스템 설정에서 설정값을 변경하도록 유도
            requestToUserForLocation()
            
        case .authorizedWhenInUse:
            currentLocation = locationManager!.location?.coordinate
            WeatherRequest().getWeatherInfo(self)
            print(currentLocation)
            
        default:
            print("default error")
        }
}

}


// MARK: - LocationManager
extension ViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        handleForLocationPermissionStatus(manager.authorizationStatus)
    }
}


// MARK: - API
extension ViewController {
    func didSuccess(_ response: WeatherResponse) {
        let item = response.response.body.items.item
        for Item in item {
            switch Item.category {
            case "PTY":
                PTYList.append(Item)
            case "WSD":
                WSDList.append(Item)
            case "T1H":
                T1HList.append(Item)
            case "SKY":
                SKYList.append(Item)
            default:
                continue
            }
        }
        self.isGetData = true
        TempInfoModel.hastempData = true
        self.temperSixTimeCollectionView.reloadData()
        
        self.temperLabel.text = T1HList[0].fcstValue + "º"
        setupIcon()
        
        let num = Int(T1HList[0].fcstValue) ?? 0
        TempInfoModel.temp = num
        
        let CVC = children[0] as! ClothesViewController
        CVC.reloadData()
        
        let imageVC = children.last as! ImageViewController
        imageVC.reloadData()
    }
    
    func didGetAddressSuccess(_ response: GeoGetAddress) {
        let result = response.response.result[0].structure.level2
        self.temperCityLabel.text = result
    }
    
    func setupIcon(){
        var image: UIImage = UIImage(systemName: "cloud.snow.fill")!
        if PTYList[0].fcstValue == "0" {
            switch SKYList[0].fcstValue {
            case "1" :
                image = UIImage(systemName: "sun.max.fill")!
            case "3" :
                image = UIImage(systemName: "cloud.sun.fill")!
            case "4" :
                image = UIImage(systemName: "cloud")!
            default:
                image = UIImage(systemName: "cloud")!
            }
        } else {
            switch PTYList[0].fcstValue {
            case "1":
                image = UIImage(named: "cloud.rain")!
            case "2", "6":
                image = UIImage(named: "cloud.sleet")!
            case "3", "7":
                image = UIImage(named: "snow_icon")!
            default:
                image = UIImage(named: "cloud.snow")!
            }
        }
        
        self.weatherIconImage.image = image
    }
}


// MARK: - UICollectionView
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "temperCell", for: indexPath) as! TemperCollectionViewCell
        if isGetData {
            cell.setupTemper(T1HList[indexPath.row])
            cell.setupIcon(SKYList[indexPath.row], PTYList[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let per: CGFloat = 6
//        let width = (collectionView.frame.width - 15)/2
        var width = collectionView.frame.width
        let padding = 10 * (per + 1)
        width = (width - padding) / per
        
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
