// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchResponse = try? newJSONDecoder().decode(SearchResponse.self, from: jsonData)

import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let response: searchResponse
}

// MARK: - Response
struct searchResponse: Codable {
    let service: searchService
    let status: String
    let record: Record
    let page: Page
    let result: searchResult
}

// MARK: - Page
struct Page: Codable {
    let total, current, size: String
}

// MARK: - Record
struct Record: Codable {
    let total, current: String
}

// MARK: - Result
struct searchResult: Codable {
    let crs, type: String
    let items: [searchItem]
}

// MARK: - Item
struct searchItem: Codable {
    let id: String
    let address: Address
    let point: Points
}

// MARK: - Address
struct Address: Codable {
    let zipcode, category, road, parcel: String
    let bldnm, bldnmdc: String
}

// MARK: - Point
struct Points: Codable {
    let x, y: String
}

// MARK: - Service
struct searchService: Codable {
    let name, version, operation, time: String
}
