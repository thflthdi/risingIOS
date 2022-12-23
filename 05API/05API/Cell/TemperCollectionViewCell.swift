//
//  TemperCollectionViewCell.swift
//  05API
//
//  Created by 황예진 on 2022/12/23.
//

import UIKit

class TemperCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var temperLabel: UILabel!
    
    public func setupIcon(_ skyData: Item,_ ptyData: Item){
        var image: UIImage = UIImage(named: "sun_icon")!
        if ptyData.fcstValue == "0" {
            if skyData.fcstValue == "1" {
                image = UIImage(named: "sun_icon")!
            }else {
                image = UIImage(named: "cloud_icon")!
            }
        } else {
            switch ptyData.fcstValue {
            case "1":
                image = UIImage(named: "rain_icon")!
            case "2":
                image = UIImage(named: "snow_icon")!
            case "3":
                image = UIImage(named: "snow_icon")!
            case "5":
                image = UIImage(named: "rain_icon")!
            default:
                image = UIImage(named: "rain_icon")!
            }
        }
        
        self.weatherIconImage.image = image
//        self.weatherIconImage.image = UIImage(named: "snow_icon")!
        
    }
    public func setupTemper(_ cellData: Item){
        let endIndex = cellData.fcstTime.index(cellData.fcstTime.startIndex, offsetBy: 1)
        self.timeLabel.text = cellData.fcstTime[...endIndex] + "h"
        self.temperLabel.text = cellData.fcstValue + "º"
//        self.temperLabel.text = "-1º"
    }
}
