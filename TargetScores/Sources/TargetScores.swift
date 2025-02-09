//
//  TargetScores.swift
//  TargetScores
//
//  Created by Isaac Ruiz on 2/9/25.
//

import ArgumentParser

@main
struct TargetScores: AsyncParsableCommand {

    mutating func run() async throws {
        let location = try await PinballMap.fetchMachines(pinballMapID: "866")

        let ratings: [Double] = [8, 9, 9.1, 9.3, 9.7]

        for machine in location.machines {
            print(machine.name)
            for rating in ratings {
                let score = try await PinScores.getScore(machineID: machine.opdbId, rating: rating)
                print(" -", rating, "->", score)
            }

        }

    }
}
