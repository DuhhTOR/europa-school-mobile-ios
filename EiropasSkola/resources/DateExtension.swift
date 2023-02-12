//
//  DateExtension.swift
//  EiropasSkola
//
//  Created by Ervins on 12/02/2023.
//

import Foundation


extension Date {
    public func startOfMonth() -> Date {
        return Calendar.current.date(
            from: Calendar.current.dateComponents(
                [.year, .month],
                from: Calendar.current.startOfDay(for: self)
            )
        )!
    }
    
    public func endOfMonth() -> Date {
        return Calendar.current.date(
            byAdding: DateComponents(month: 1, day: -1),
            to: self.startOfMonth()
        )!
    }
}

