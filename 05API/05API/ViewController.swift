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
            getWeatherInfo()
            print(currentLocation)
            
        default:
            print("default error")
        }
}

    // api 통신
    func getWeatherInfo(){
        let url = getUrl()
        AF.request(url, method: .get)
            .responseDecodable(of: ViliageFcstInfoService.self){ response in
                switch response.result {
                case .success(let response):
                    print("DEBUG>> OpenWeather Response \(response) ")
                    
                case .failure(let error):
                    print("DEBUG>> OpenWeather Get Error : \(error.localizedDescription)")
                }
            }
    }
    
    func getUrl() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let date = formatter.string(from: Date())
        formatter.dateFormat = "HH00"
        let time = formatter.string(from: Date() - 3600)
        
        // FIXME: 시뮬은 위도 경도가 샌프란시스코로 나옴
        //x - 경도
//        let currentLogitude = Int(currentLocation.longitude)
        let currentLogitude = 37
        //y - 위도
//        let currentLatitude = Int(currentLocation.latitude)
        let currentLatitude = 126
        
        print(date, time, currentLogitude, currentLatitude, Constant().WEATHER_API_KEY)
        
        let url = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst?ServiceKey=\(Constant().WEATHER_API_KEY)&base_date=\(date)&base_time=\(time)&dataType=JSON&numOfRows=1000&nx=\(currentLogitude)&ny=\(currentLatitude)&pageNo=1"
        return url
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        handleForLocationPermissionStatus(manager.authorizationStatus)
    }
}
