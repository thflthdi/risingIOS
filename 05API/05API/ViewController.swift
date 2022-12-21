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
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationAuth()
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
        
    }
}
