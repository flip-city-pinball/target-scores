//
//  Communicator.swift
//  TargetScores
//
//  Created by Isaac Ruiz on 2/9/25.
//

import Foundation

// MARK: - PinScores
/// https://pinscores.net/api/v1/equivalentscore?machineid=[OPDB ID]&rating=[Rating]
struct Score: Decodable {
    let score: Int
}

func getScore(machineID: String, rating: Double) async throws -> Score {

    let id = {
        let components = machineID.split(separator: "-")
        if components.count >= 2 {
            let prefix = components.prefix(2).joined(separator: "-")
            return prefix
        }
        return machineID
    }()

    return try await request(url: "https://pinscores.net/api/v1/equivalentscore?machineid=\(id)&rating=\(rating)")
}

// MARK: - Pinball Map

/// https://pinballmap.com/api/v1/docs/1.0/locations/machine_details.html
struct LocationMachines: Decodable {
    let machines: [Machine]

    struct Machine: Codable {
        let id: Int
        let name: String
        let year: Int
        let manufacturer: String
        let opdb_id: String
    }
}

func getLocationMachines(pinballMapID: String) async throws -> LocationMachines {
    try await request(url: "https://pinballmap.com/api/v1/locations/\(pinballMapID)/machine_details.json")
}

// MARK: URL Request
func request<T: Decodable>(url string: String) async throws -> T {
    guard let url = URL(string: string) else {
        throw URLError(.badURL)
    }

    let (data, _) = try await URLSession.shared.data(from: url)

    let posts = try JSONDecoder().decode(T.self, from: data)
    return posts
}
