//
//  PinScores.swift
//  TargetScores
//
//  Created by Isaac Ruiz on 2/9/25.
//

import Foundation

enum PinScores {

    struct Score: Codable {
        let score: Int
    }

    static func getScore(machineID: String, rating: Double) async throws -> Score {

        let id = {
            let components = machineID.split(separator: "-")
            if components.count >= 2 {
                let prefix = components.prefix(2).joined(separator: "-")
                return prefix
            }
            return machineID
        }()

        guard let url = URL(string: "https://pinscores.net/api/v1/equivalentscore?machineid=\(id)&rating=\(rating)") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let posts = try JSONDecoder().decode(Score.self, from: data)
        return posts
    }
}
