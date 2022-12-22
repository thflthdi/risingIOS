//
//  WeatherRequest.swift
//  05API
//
//  Created by 황예진 on 2022/12/21.
//

import Foundation
import Alamofire
import UIKit

class WeatherRequest {
    
    // api 통신
    func getWeatherInfo(_ viewController: ViewController){
        let url = getUrl()
        AF.request(url,
                   method: .get
        )
            .responseDecodable(of: WeatherResponse.self){ response in
                
                switch response.result {
                case .success(let response):
//                    print("DEBUG>> OpenWeather Response ")
                    viewController.didSuccess(response)
                    
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
        
        let url = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst?ServiceKey=\(Constant().WEATHER_API_KEY)&base_date=\(date)&base_time=\(time)&dataType=JSON&numOfRows=1000&nx=\(currentLogitude)&ny=\(currentLatitude)&pageNo=1"
        return url
    }
}
