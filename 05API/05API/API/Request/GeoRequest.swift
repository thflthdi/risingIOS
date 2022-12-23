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
    func getAddress(_ viewController: ViewController,_ pointX: Double,_ pointY: Double){
        let url = "http://api.vworld.kr/req/address?key=2A86359F-2472-3AC7-AAD8-81C494B3DFBC&request=getAddress&point=\(pointX),\(pointY)&service=address&type=ROAD"
        AF.request(url,
                   method: .get
        )
            .responseDecodable(of: GeoGetAddress.self){ response in
                
                switch response.result {
                case .success(let response):
                    print("DEBUG>> getAddress Response ")
                    viewController.didGetAddressSuccess(response)
                    
                case .failure(let error):
                    print("DEBUG>> getAddress Get Error : \(error.localizedDescription)")
                }
            }
    }
    
    func search(_ viewController: MapViewController,_ input: String){
        let url = "http://api.vworld.kr/req/search?key=2A86359F-2472-3AC7-AAD8-81C494B3DFBC&request=search&service=search&type=ADDRESS&query=\(input)&size=10&category=ROAD".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.default
        )
            .responseDecodable(of: SearchResponse.self){ response in
                
                switch response.result {
                case .success(let response):
                    print("DEBUG>> search Response ")
                    viewController.didSearchSuccess(response)
                    
                case .failure(let error):
                    print(response)
                    print("DEBUG>> search Get Error : \(error.localizedDescription)")
                }
            }
    }
}
