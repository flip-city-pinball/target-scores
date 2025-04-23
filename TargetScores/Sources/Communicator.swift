//
//  Communicator.swift
//  TargetScores
//
//  Created by Isaac Ruiz on 2/9/25.
//

import Foundation
import PinballMap

// MARK: - PinScores

struct Score: Decodable {
    let score: Int
}

struct Rating: Decodable {
    let rating: Double
}

extension String {
    func normalizeID() -> String {
        let components = self.split(separator: "-")
        if components.count >= 2 {
            let prefix = components.prefix(2).joined(separator: "-")
            return prefix
        }
        return self
    }
}

/// https://pinscores.net/api/v1/equivalentscore?machineid=[OPDB ID]&rating=[Rating]
func getScore(machineID: String, rating: Double) async throws -> Score {

    let id = machineID.normalizeID()

    return try await request(url: "https://pinscores.net/api/v1/equivalentscore?machineid=\(id)&rating=\(rating)")
}

func getRating(machineID: String, score: Int) async throws -> Rating {
    let id = machineID.normalizeID()
    return try await request(url: "https://pinscores.net/api/v1/rating?machineid=\(id)&score=\(score)")
}

// MARK: - Pinball Map


/// https://pinballmap.com/api/v1/docs/1.0/locations/machine_details.html
func getLocationMachines(pinballMapID: String) async throws -> LocationMachines {
    try await PinballMap.request(.locationMachines(id: UInt(pinballMapID) ?? 0))
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
