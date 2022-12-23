// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let geoGetAddress = try? newJSONDecoder().decode(GeoGetAddress.self, from: jsonData)

import Foundation

// MARK: - GeoGetAddress
struct GeoGetAddress: Codable {
    let response: getAddressResponse
    
}

// MARK: - Response
struct getAddressResponse: Codable {
    let service: Service
    let status: String
    let input: Input
    let result: [Result]
}

// MARK: - Input
struct Input: Codable {
    let point: Point
    let crs, type: String
}

// MARK: - Point
struct Point: Codable {
    let x, y: String
}

// MARK: - Result
struct Result: Codable {
    let zipcode, type, text: String
    let structure: Structure
}

// MARK: - Structure
struct Structure: Codable {
    let level0, level1, level2, level3: String
    let level4L, level4LC, level4A, level4AC: String
    let level5, detail: String
}

// MARK: - Service
struct Service: Codable {
    let name, version, operation, time: String
}
