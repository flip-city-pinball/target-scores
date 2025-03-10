//
//  TargetScores.swift
//  TargetScores
//
//  Created by Isaac Ruiz on 2/9/25.
//

import ArgumentParser

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

        let location = try await getLocationMachines(pinballMapID: id)

        let ratings: [Double] = ratings.split(separator: ",").map { Double($0) ?? 0 }.sorted { $1 > $0 }

        for machine in location.machines {

            print(machine.name)
            
            if onlyScores == false {
                print("\u{0009}- id: \(machine.opdb_id)")
                print("\u{0009}- scores:")
            }

            for (offset, rating) in ratings.enumerated().reversed() {
                let score = try await getScore(machineID: machine.opdb_id, rating: rating)
                let roundedScore = rounded ? score.score.rounded : score.score
                if onlyScores == true {
                    print(roundedScore.prettyString)
                } else {
                    let string = ["\(offset + 1)", roundedScore.prettyString, "(\(rating))"]
                    print("\u{0009}\u{0009}" + string.joined(separator: "\u{0009}"))
                }
            }
        }
    }
}
