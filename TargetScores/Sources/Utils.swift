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

let ratingFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 3
    numberFormatter.minimumFractionDigits = 0
    numberFormatter.minimumIntegerDigits = 1
    return numberFormatter
}()

extension Int {

    /// Round down after 3 orders of magnitude
    var rounded: Int {
        guard self > 0 else { return 0 }
        let magnitude = Int(log10l(Double(self)))
        let factor = pow(10.0, Double(magnitude - 1))
        let rounded = Int(round(Double(self) / factor) * factor)
        return rounded
    }

    var prettyString: String {
        numberFormatter.string(for: self) ?? String(self)
    }
}
