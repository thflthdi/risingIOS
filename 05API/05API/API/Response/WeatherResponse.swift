//
//  WeatherModel.swift
//  05API
//
//  Created by 황예진 on 2022/12/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let viliageFcstInfoService = try? newJSONDecoder().decode(ViliageFcstInfoService.self, from: jsonData)

import Foundation

// MARK: - ViliageFcstInfoService
struct WeatherResponse: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Codable {
    let dataType: String
    let items: Items
    let pageNo, numOfRows, totalCount: Int
}

// MARK: - Items
struct Items: Codable {
    let item: [Item]
}

// MARK: - Item
struct Item: Codable {
    let baseDate, baseTime, category, fcstDate: String
    let fcstTime, fcstValue: String
    let nx, ny: Int
}

// MARK: - Header
struct Header: Codable {
    let resultCode, resultMsg: String
}
