//
//  TargetScoresTests.swift
//  TargetScores
//
//  Created by Isaac Ruiz on 2/9/25.
//

import Testing
import Foundation
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

    @Test
    func numbers() {
        var double = 0.25
        var array: [Double] = []

        for i in 1...10 {
            print(double)
            array.append(double)
            double += 1.55 * ((11 - Double(i))/11)

            // double += 0.677 + (Double(i)/8.0) for 8
            // double += 0.93 + (Double(i)/8.0) with 7
            // double += 1.93 * ((10 - Double(i))/10)

            // double += 1.68 * ((12 - Double(i))/12)
        }


        // double += 1.55 * ((11 - Double(i))/11)

        print("10804", array.compactMap { ratingFormatter.string(for: $0) }.joined(separator: ","), "--rounded")
        // 0.75,1.552,2.479,3.531,4.708,6.01,7.4369,8.9889
        // 0.75,1.805,2.985,4.29,5.72,7.275,8.955 // double += 0.93 + (Double(i)/8.0) with 7
        // 0.25,1.87,3.31,4.57,5.65,6.55,7.27,7.815,8.17,8.35
    }

    @Test
    func linear() {
        var start = 0.1
        let end = 8.0
        let total = 10
        var array: [Double] = []
        
        let diff: Double = (end - start) / Double(total - 1)
        for i in 1...total {
            print(start)
            array.append(start)
            start += diff
        }


        // double += 1.55 * ((11 - Double(i))/11)

        print("10804", array.compactMap { ratingFormatter.string(for: $0) }.joined(separator: ","), "--rounded")
        // 0.75,1.552,2.479,3.531,4.708,6.01,7.4369,8.9889
        // 0.75,1.805,2.985,4.29,5.72,7.275,8.955 // double += 0.93 + (Double(i)/8.0) with 7
        // 0.25,1.87,3.31,4.57,5.65,6.55,7.27,7.815,8.17,8.35
    }
}
