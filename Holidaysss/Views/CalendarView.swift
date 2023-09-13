//
//  CalendarView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 12-09-23.
//

import SwiftUI

// Define a data structure to represent a month with holidays
struct MonthWithHolidays {
    let month: String
    let holidays: [Holiday]
}


struct CalendarView: View {
    // Your array of holidays
    let holidays: [Holiday]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
                ForEach(monthsWithHolidays, id: \.month) { monthWithHolidays in
                    MonthGridView(monthWithHolidays: monthWithHolidays)
                }
            }
            .padding()
        }
    }

    // Compute an array of MonthWithHolidays based on your data
    var monthsWithHolidays: [MonthWithHolidays] {
        let holidayMonths = Dictionary(grouping: holidays) { holiday in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: holiday.date) ?? Date()
            dateFormatter.dateFormat = "MM/yyyy"
            return dateFormatter.string(from: date)
        }

        return holidayMonths.map { (month, holidays) in
            MonthWithHolidays(month: month, holidays: holidays)
        }
    }

    func calculateDaysInMonth(month: String) -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yyyy"
        guard let date = dateFormatter.date(from: month) else {
            return []
        }

        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)!
        let daysInMonth = (range.lowerBound ..< range.upperBound).compactMap {
            calendar.dateComponents([.day], from: date.setting(.day, to: $0)).day
        }

        return daysInMonth.map { String($0) }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(holidays: [.defaultValue])
    }
}
