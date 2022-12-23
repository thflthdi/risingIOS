//
//  ViewController.swift
//  05API
//
//  Created by 황예진 on 2022/12/20.
//

import UIKit
import CoreLocation
import Alamofire
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

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
    @IBOutlet weak var temperUIView: UIView!
    
    @IBOutlet weak var kakaoLoginImage: UIImageView!
    @IBOutlet weak var loginMsgLabel: UILabel!
    
// MARK: - 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
    
        GeoRequest().getAddress(self, 126.731368000, 37.486935000)
        
        radiusUIView()
        checkLocationAuth()
        
        self.temperSixTimeCollectionView.delegate = self
        self.temperSixTimeCollectionView.dataSource = self

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handelTap(sender:)))
        temperUIView.addGestureRecognizer(tapGesture)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handelTapKakao(sender:)))
        kakaoLoginImage.addGestureRecognizer(tapGesture2)
        kakaoLoginImage.isUserInteractionEnabled = true
        
        loginMsgLabel.isHidden = true
    }
    
    
// MARK: - function
    
    @objc func handelTap(sender: UITapGestureRecognizer){
        print(#function)
        let mapVC = storyboard?.instantiateViewController(withIdentifier: "mapVC") as! MapViewController
        mapVC.delegate = self
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    @objc func handelTapKakao(sender: UITapGestureRecognizer){
        print(#function)
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoTalk() success.")

                //do something
                _ = oauthToken
                let accessToken = oauthToken?.accessToken
                self.setUserInfo()
            }
        }
        
    }
    
    func setUserInfo() {
        //사용자 관리 api 호출
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
        //do something
                _ = user
                
                print(user?.kakaoAccount?.profile?.nickname)
                self.kakaoLoginImage.isHidden = true
                self.loginMsgLabel.isHidden = false
                self.loginMsgLabel.text = "반갑습니다. \(user?.kakaoAccount?.profile?.nickname ?? "")님"
            }
        }
    }

    
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
            WeatherRequest().getWeatherInfo(self, 0, 0)
            
        default:
            print("default error")
        }
    }

}

extension ViewController: MapViewControllerDelegate {
    func endSearch(_ x: String,_ y: String){
        print("\(x)//------------------//\(y)")
        let X = Double(x) ?? 0
        let Y = Double(y) ?? 0
        GeoRequest().getAddress(self, X, Y)
        WeatherRequest().getWeatherInfo(self, Int(X), Int(Y))
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
        PTYList.removeAll()
        WSDList.removeAll()
        T1HList.removeAll()
        SKYList.removeAll()
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
        print(T1HList)
        self.isGetData = true
        TempInfoModel.hastempData = true
        self.temperSixTimeCollectionView.reloadData()
        
        self.temperLabel.text = T1HList[0].fcstValue + "º"
//        self.temperLabel.text = "-1º"
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
        var backImage: UIImage = UIImage(named: "cloud")!
        if PTYList[0].fcstValue == "0" {
            switch SKYList[0].fcstValue {
            case "1" :
                image = UIImage(systemName: "sun.max.fill")!
                backImage = UIImage(named: "sunny")!
            case "3" :
                image = UIImage(systemName: "cloud.sun.fill")!
                backImage = UIImage(named: "cloud")!
            case "4" :
                image = UIImage(systemName: "cloud")!
                backImage = UIImage(named: "cloud")!
            default:
                image = UIImage(systemName: "cloud")!
                backImage = UIImage(named: "cloud")!
            }
        } else {
            switch PTYList[0].fcstValue {
            case "1":
                image = UIImage(systemName: "cloud.rain")!
                backImage = UIImage(named: "rain")!
            case "2", "6":
                image = UIImage(systemName: "cloud.sleet")!
                backImage = UIImage(named: "snow")!
            case "3", "7":
                image = UIImage(systemName: "cloud.snow.fill")!
                backImage = UIImage(named: "snow")!
            default:
                image = UIImage(systemName: "cloud.snow.fill")!
                backImage = UIImage(named: "snow")!
            }
        }
        
        self.weatherIconImage.image = image
        self.backgroundImageView.image = backImage
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
