//
//  PinballMap.swift
//  TargetScores
//
//  Created by Isaac Ruiz on 2/9/25.
//

import Foundation

enum PinballMap {
    static func fetchMachines(pinballMapID: String) async throws -> LocationMachines {
        // The URL of the API endpoint
        
        guard let url = URL(string: "https://pinballmap.com/api/v1/locations/\(pinballMapID)/machine_details.json") else {
            throw URLError(.badURL)
        }

        print(url.absoluteString)
        // Create a URLSession instance
        let (data, _) = try await URLSession.shared.data(from: url)

        // Decode the JSON data into an array of Post objects
        let posts = try JSONDecoder().decode(LocationMachines.self, from: data)

        return posts
    }
}
