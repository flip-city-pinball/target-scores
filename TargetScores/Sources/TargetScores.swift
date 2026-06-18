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

    @Flag(help: "Render as a CSV")
    var csv: Bool = false

    static let nameMap: [String: String] = [
        "Abra Ca Dabra": "Abra",
        "Black Knight: Sword of Rage (Pro)": "BK:SoR",
        "Dungeons & Dragons: The Tyrant's Eye (Pro)": "D&D",
        "Iron Maiden: Legacy of the Beast (Premium)": "Maiden",
        "JAWS (Pro)": "JAWS",
        "James Bond 007 (Pro)": "007",
        "King Kong: Myth of Terror Island (Premium)": "Kong",
        "Pinball Lizard": "Lizard",
        "Pokémon (Premium)": "Pokémon",
        "Pulp Fiction (SE)": "Pulp Fiction",
        "Red & Ted's Road Show": "Road Show",
        "Royal Flush Deluxe": "Royal Flush",
        "Star Wars: Fall of the Empire (Pro)": "Star Wars",
        "The Uncanny X-Men (Premium)": "X-Men",
        "The Walking Dead Remastered (Premium)": "Walking Dead",
        "Twilight Zone": "Twilight",
    ]

    mutating func run() async throws {
        let ratings: [Double] = ratings.split(separator: ",").map { Double($0) ?? 0 }.sorted { $1 > $0 }
        let location = try await getLocationMachines(pinballMapID: id)

        if csv {
            let header = ["name"] + (1...ratings.count).reversed().map { "score\($0)" }
            print(header.joined(separator: ","))
        }
        for machine in location.machines {
            do {
                try await renderMachine(machine: machine, ratings: ratings)
            } catch {
                print("Error:", machine.name, error)
            }

            if !csv {
                print("")
            }
        }
    }

    func renderMachine(machine: LocationMachines.Machine, ratings: [Double]) async throws {
        if !csv {
            print(machine.name)

            if onlyScores == false {
                print(" - id: \(machine.opdb_id)")
                print(" - scores:")
            }
        }

        var scores: [Score] = []

        for rating in ratings.reversed() {
            let score = try await getScore(machineID: machine.opdb_id, rating: rating)
            scores.append(score)
        }

        let values: [Int] = scores.map {
            rounded ? $0.score.rounded : $0.score
        }

        if csv {
            let displayName = TargetScores.nameMap[machine.name] ?? machine.name
            let row = [displayName] + values.map { "\($0)" }
            print(row.joined(separator: ","))
        } else if onlyScores {
            for value in values {
                print(value.prettyString)
            }
        } else {
            for (idx, value) in values.enumerated() {
                let label = ratings.count - idx
                let string = ["\(label)", "—", value.prettyString]
                print("    " + string.joined(separator: "\u{0009}"))
            }
        }
    }
}
