//
//  DecimalWon.swift
//  02lifecycle
//
//  Created by íŠėė§ on 2022/12/09.
//

import Foundation

public func DecimalWon(_ value: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: value))! + "ė"
        
        return result
    }
