//
//  DateViewModel.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 04-09-23.
//

import Foundation
import SwiftUI

class DateViewModel: ObservableObject {
    @Published var currentDate: Date = Date()
    @Published var nextHoliday: Holiday?

    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: currentDate)
    }

    var currentYear: String {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDate)
        return String(year)
    }

    func determineNextHoliday(data: [Holiday]) {
        // Get the current date as "YYYY-MM-DD"
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDateString = formatter.string(from: currentDate)

        // Find the first holiday that occurs after today
        if let nextHoliday = data
            .filter({ $0.date > currentDateString })
            .min(by: { $0.date < $1.date }) {
            self.nextHoliday = nextHoliday
        }
    }

}
