//
//  TargetScoresTests.swift
//  TargetScores
//
//  Created by Isaac Ruiz on 2/9/25.
//

import Testing
@testable import TargetScores

@Suite("TargetScoresTests")
struct TargetScoresTests {

    @Test("Test Score Rounding", arguments: [
        (17_124, 17_000),
        (173_124, 170_000),
        (120_173_124, 120_000_000),
        (3_117, 3_100),
        (32_117, 32_000),
        (3, 3),
        (131, 130),
        (0, 0),
        (-13311, 0)
    ])
    func rounded(input: Int, expected: Int) {
        #expect(input.rounded == expected)
    }

    @Test("Pretty String", arguments: [
        (1, "1"),
        (13, "13"),
        (133, "133"),
        (17_124, "17,124"),
        (123404, "123,404"),
        (34511412, "34,511,412"),
        (234234624141232, "234,234,624,141,232")
    ])
    func prettyString(input: Int, expected: String) {
        #expect(input.prettyString == expected)
    }
}
