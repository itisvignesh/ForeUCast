//
//  DateUtils.swift
//  ForeUCast
//
//  Created by Vigneshwaran Murugesan on 31/05/23.
//

import Foundation
class DateUtils {
    
    /// Converts timestamp into readable string without time data
    /// - Parameter timeStamp: unix timestamp
    /// - Returns: Human readable string excluding time but with date.
    static func dayStringOfTimestamp(timeStamp: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: Date(timeIntervalSince1970: timeStamp))
    }
}
