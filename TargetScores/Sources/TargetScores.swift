//
//  TargetScores.swift
//  TargetScores
//
//  Created by Isaac Ruiz on 2/9/25.
//

import ArgumentParser
import PinballMap

@main
struct TargetScores: AsyncParsableCommand {

    @Argument(help: "Pinball Map location id.")
    var id: String

    @Argument(help: "Comma delimited array of ratings.")
    var ratings: String

    @Flag(help: "Only show scores.")
    var onlyScores: Bool = false

    @Flag(help: "Scores are rounded down after 2 orders of magnitude.")
    var rounded: Bool = false

    mutating func run() async throws {
        let ratings: [Double] = ratings.split(separator: ",").map { Double($0) ?? 0 }.sorted { $1 > $0 }
        let location = try await getLocationMachines(pinballMapID: id)
        for machine in location.machines {
            do {
                try await renderMachine(machine: machine, ratings: ratings)
            } catch {
                print("Error:", machine.name, error)
            }

            print("")
        }
    }

    func renderMachine(machine: LocationMachines.Machine, ratings: [Double]) async throws {
        print(machine.name)

        if onlyScores == false {
            print(" - id: \(machine.opdb_id)")
            print(" - scores:")
        }

        for (offset, rating) in ratings.enumerated().reversed() {
            let score = try await getScore(machineID: machine.opdb_id, rating: rating)

            let roundedScore = rounded ? score.score.rounded : score.score

            let newRating = try await getRating(machineID: machine.opdb_id, score: roundedScore)

            if onlyScores == true {
                print(roundedScore.prettyString)
            } else {
                let string = ["\(offset + 1)","—", roundedScore.prettyString, "(\(ratingFormatter.string(for: newRating.rating)!))"]
                print("    " + string.joined(separator: "\u{0009}"))
            }
        }
    }
}
