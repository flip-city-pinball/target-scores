//
//  Utils.swift
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
