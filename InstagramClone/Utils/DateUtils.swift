//
//  DateUtils.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 16/05/22.
//

import Foundation
import Firebase

class DateUtils {
    static func abbreviateDate(date: Timestamp) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: date.dateValue(), to: Date()) ?? ""
    }
}
