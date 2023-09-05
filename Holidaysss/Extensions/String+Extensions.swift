//
//  String+Extensions.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 04-09-23.
//

import Foundation

extension String {
    func dateDetails() -> (day: String, weekday: String, month: String)? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let date = dateFormatter.date(from: self) else {
            print("Invalid date string")
            return nil
        }

        let calendar = Calendar.current
        let dayNumber = calendar.component(.day, from: date)

        guard let weekdaySymbol = calendar.weekdaySymbols[calendar.component(.weekday, from: date) - 1] as String?,
              let monthSymbol = calendar.monthSymbols[calendar.component(.month, from: date) - 1] as String? else {
            return nil
        }

        let dayString = String(format: "%02d", dayNumber)

        return (day: dayString, weekday: weekdaySymbol, month: monthSymbol)
    }

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
