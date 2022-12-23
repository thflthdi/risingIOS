//
//  GeoRequest.swift
//  05API
//
//  Created by 황예진 on 2022/12/23.
//

import Foundation
import UIKit
import Alamofire

class GeoRequest {
    func getAddress(_ viewController: ViewController){
        let url = "http://api.vworld.kr/req/address?key=2A86359F-2472-3AC7-AAD8-81C494B3DFBC&request=getAddress&point=126.731368000,37.486935000&service=address&type=ROAD"
        AF.request(url,
                   method: .get
        )
            .responseDecodable(of: GeoGetAddress.self){ response in
                
                switch response.result {
                case .success(let response):
                    print("DEBUG>> OpenWeather Response ")
                    viewController.didGetAddressSuccess(response)
                    
                case .failure(let error):
                    print("DEBUG>> OpenWeather Get Error : \(error.localizedDescription)")
                }
            }
    }
    
    func getXY(_ viewController: ViewController){
        
    }
}
