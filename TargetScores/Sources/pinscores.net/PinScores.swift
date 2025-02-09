//
//  PinScores.swift
//  TargetScores
//
//  Created by Isaac Ruiz on 2/9/25.
//

import Foundation

let numberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.groupingSeparator = ","
    numberFormatter.groupingSize = 3
    numberFormatter.minimumIntegerDigits = 1
    numberFormatter.maximumFractionDigits = 0
    return numberFormatter
}()

struct Score: Codable {
    let score: Int
}

extension Int {

    /// Round down after first 2 digits
    var rounded: Int {
        let magnitude = Int(log10l(Double(self)))
        let factor = pow(10.0, Double(magnitude - 1))
        let rounded = Int(round(Double(self) / factor) * factor)
        return rounded
    }

    /// Round down after first 2 digits
    var prettyString: String {
        numberFormatter.string(for: self) ?? String(self)
    }
}

enum PinScores {

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
