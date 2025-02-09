//
//  LocationMachines.swift
//  TargetScores
//
//  Created by Isaac Ruiz on 2/9/25.
//

struct LocationMachines: Codable {
    let machines: [Machine]
}

struct Machine: Codable {
    let id: Int
    let name: String
    let year: Int
    let manufacturer: String
    let opdbId: String

    // Define the keys for custom JSON keys that differ from property names
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case year
        case manufacturer
        case opdbId = "opdb_id"
    }
}
