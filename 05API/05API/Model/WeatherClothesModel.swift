//
//  WeatherClothesModel.swift
//  05API
//
//  Created by 황예진 on 2022/12/23.
//

import Foundation
import UIKit

struct ClothesInfo {
    var minTemp: Int
    var maxTemp: Int
    var name: String
}

struct ImageMapping {
    var minTemp: Int
    var maxTemp: Int
    var image: UIImage
}

class WeatherClothesModel {
    let clothesList: [ClothesInfo] = [
        ClothesInfo(minTemp: -99, maxTemp: 4, name: "패딩"),
        ClothesInfo(minTemp: -99, maxTemp: 4, name: "두꺼운 코트"),
        ClothesInfo(minTemp: -99, maxTemp: 4, name: "히트텍"),
        ClothesInfo(minTemp: -99, maxTemp: 4, name: "목도리"),
        ClothesInfo(minTemp: -99, maxTemp: 4, name: "장갑"),
        ClothesInfo(minTemp: -99, maxTemp: 4, name: "기모제품"),
        ClothesInfo(minTemp: 5, maxTemp: 8, name: "코트"),
        ClothesInfo(minTemp: 5, maxTemp: 8, name: "가죽 자켓"),
        ClothesInfo(minTemp: 5, maxTemp: 8, name: "히트텍"),
        ClothesInfo(minTemp: 5, maxTemp: 8, name: "니트"),
        ClothesInfo(minTemp: 5, maxTemp: 8, name: "두꺼운 바지"),
        ClothesInfo(minTemp: 5, maxTemp: 8, name: "기모제품"),
        ClothesInfo(minTemp: 9, maxTemp: 11, name: "자켓"),
        ClothesInfo(minTemp: 9, maxTemp: 11, name: "야상"),
        ClothesInfo(minTemp: 9, maxTemp: 11, name: "트렌치 코트"),
        ClothesInfo(minTemp: 9, maxTemp: 11, name: "니트"),
        ClothesInfo(minTemp: 9, maxTemp: 11, name: "기모 후드티"),
        ClothesInfo(minTemp: 9, maxTemp: 11, name: "기모 바지"),
        ClothesInfo(minTemp: 9, maxTemp: 11, name: "스타킹"),
        ClothesInfo(minTemp: 9, maxTemp: 11, name: "레이어드"),
        ClothesInfo(minTemp: 12, maxTemp: 16, name: "자켓"),
        ClothesInfo(minTemp: 12, maxTemp: 16, name: "가디건"),
        ClothesInfo(minTemp: 12, maxTemp: 16, name: "야상"),
        ClothesInfo(minTemp: 12, maxTemp: 16, name: "맨투맨"),
        ClothesInfo(minTemp: 12, maxTemp: 16, name: "스타킹"),
        ClothesInfo(minTemp: 12, maxTemp: 16, name: "청바지"),
        ClothesInfo(minTemp: 12, maxTemp: 16, name: "면바지"),
        ClothesInfo(minTemp: 17, maxTemp: 19, name: "얇은 니트"),
        ClothesInfo(minTemp: 17, maxTemp: 19, name: "얇은 가디건"),
        ClothesInfo(minTemp: 17, maxTemp: 19, name: "얇은 자켓"),
        ClothesInfo(minTemp: 17, maxTemp: 19, name: "후드티"),
        ClothesInfo(minTemp: 17, maxTemp: 19, name: "맨투맨"),
        ClothesInfo(minTemp: 17, maxTemp: 19, name: "바람막이"),
        ClothesInfo(minTemp: 17, maxTemp: 19, name: "긴바지"),
        ClothesInfo(minTemp: 17, maxTemp: 19, name: "슬랙스"),
        ClothesInfo(minTemp: 17, maxTemp: 19, name: "청바지"),
        ClothesInfo(minTemp: 20, maxTemp: 22, name: "얇은 가디건"),
        ClothesInfo(minTemp: 20, maxTemp: 22, name: "긴팔 티셔츠"),
        ClothesInfo(minTemp: 20, maxTemp: 22, name: "셔츠/블라우스"),
        ClothesInfo(minTemp: 20, maxTemp: 22, name: "후드티"),
        ClothesInfo(minTemp: 20, maxTemp: 22, name: "면바지"),
        ClothesInfo(minTemp: 20, maxTemp: 22, name: "슬랙스"),
        ClothesInfo(minTemp: 20, maxTemp: 22, name: "7부바지"),
        ClothesInfo(minTemp: 20, maxTemp: 22, name: "청바지"),
        ClothesInfo(minTemp: 23, maxTemp: 27, name: "반팔 티셔츠"),
        ClothesInfo(minTemp: 23, maxTemp: 27, name: "얇은 셔츠"),
        ClothesInfo(minTemp: 23, maxTemp: 27, name: "얇은 긴팔 티셔츠"),
        ClothesInfo(minTemp: 23, maxTemp: 27, name: "반바지"),
        ClothesInfo(minTemp: 23, maxTemp: 27, name: "면바지"),
        ClothesInfo(minTemp: 28, maxTemp: 99, name: "민소매"),
        ClothesInfo(minTemp: 28, maxTemp: 99, name: "반팔"),
        ClothesInfo(minTemp: 28, maxTemp: 99, name: "반바지"),
        ClothesInfo(minTemp: 28, maxTemp: 99, name: "민소매 원피스"),
        ClothesInfo(minTemp: 28, maxTemp: 99, name: "린넨"),
        ClothesInfo(minTemp: 28, maxTemp: 99, name: "썬글라스"),
        ClothesInfo(minTemp: 28, maxTemp: 99, name: "양산"),
    ]
    
    let imageList: [ImageMapping] = [
        ImageMapping(minTemp: -99, maxTemp: 4, image: UIImage(named: "four")!),
        ImageMapping(minTemp: -99, maxTemp: 4, image: UIImage(named: "four1")!),
        ImageMapping(minTemp: -99, maxTemp: 4, image: UIImage(named: "four2")!),
        ImageMapping(minTemp: 5, maxTemp: 8, image: UIImage(named: "five")!),
        ImageMapping(minTemp: 5, maxTemp: 8, image: UIImage(named: "five1")!),
        ImageMapping(minTemp: 5, maxTemp: 8, image: UIImage(named: "five2")!),
        ImageMapping(minTemp: 9, maxTemp: 11, image: UIImage(named: "nine")!),
        ImageMapping(minTemp: 9, maxTemp: 11, image: UIImage(named: "nine1")!),
        ImageMapping(minTemp: 9, maxTemp: 11, image: UIImage(named: "nine2")!),
        ImageMapping(minTemp: 12, maxTemp: 16, image: UIImage(named: "twelve")!),
        ImageMapping(minTemp: 12, maxTemp: 16, image: UIImage(named: "twelve1")!),
        ImageMapping(minTemp: 12, maxTemp: 16, image: UIImage(named: "twelve2")!),
        ImageMapping(minTemp: 17, maxTemp: 19, image: UIImage(named: "seventeen")!),
        ImageMapping(minTemp: 17, maxTemp: 19, image: UIImage(named: "seventeen1")!),
        ImageMapping(minTemp: 17, maxTemp: 19, image: UIImage(named: "seventeen2")!),
        ImageMapping(minTemp: 20, maxTemp: 22, image: UIImage(named: "twenty")!),
        ImageMapping(minTemp: 20, maxTemp: 22, image: UIImage(named: "twenty1")!),
        ImageMapping(minTemp: 20, maxTemp: 22, image: UIImage(named: "twenty2")!),
        ImageMapping(minTemp: 23, maxTemp: 27, image: UIImage(named: "twenty_three")!),
        ImageMapping(minTemp: 23, maxTemp: 27, image: UIImage(named: "twenty_three1")!),
        ImageMapping(minTemp: 23, maxTemp: 27, image: UIImage(named: "twenty_three2")!),
        ImageMapping(minTemp: 28, maxTemp: 99, image: UIImage(named: "twenty_eight")!),
        ImageMapping(minTemp: 28, maxTemp: 99, image: UIImage(named: "twenty_eight1")!),
        ImageMapping(minTemp: 28, maxTemp: 99, image: UIImage(named: "twenty_eight2")!),
        
    ]
    
    public func count(_ temp: Int) -> Int{
        let filteredList = clothesList.filter { info in
            temp >= info.minTemp && temp <= info.maxTemp
        }
        return filteredList.count
    }
    
    public func read(_ at: Int,_ temp: Int) -> ClothesInfo{
        let filteredList = clothesList.filter { info in
            temp >= info.minTemp && temp <= info.maxTemp
        }
        return filteredList[at]
    }
    
    public func getImage(_ at: Int,_ temp: Int) -> ImageMapping{
        let filteredList = imageList.filter { info in
            temp >= info.minTemp && temp <= info.maxTemp
        }
        return filteredList[at]
    }

}
