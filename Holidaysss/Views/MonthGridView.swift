//
//  MonthGridView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 12-09-23.
//

import SwiftUI

struct MonthGridView: View {
    let monthWithHolidays: MonthWithHolidays
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(monthWithHolidays.month)
                .font(.headline)
                .padding(.top, 10)

            let numberOfDaysInMonth = calculateNumberOfDaysInMonth(month: monthWithHolidays.month)

            ForEach(1..<numberOfDaysInMonth + 1, id: \.self) { day in
                let isHoliday = isHoliday(day: "\(day)", in: monthWithHolidays.month)
                DayView(day: String(day), isHoliday: isHoliday)
            }
        }
    }
    
    func isHoliday(day: String, in month: String) -> Bool {
        return monthWithHolidays.holidays.contains { holiday in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let holidayDate = dateFormatter.date(from: holiday.date) ?? Date()
            dateFormatter.dateFormat = "dd"
            let dayOfMonth = dateFormatter.string(from: holidayDate)
            return dayOfMonth == day
        }
    }

    func calculateNumberOfDaysInMonth(month: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yyyy"
        guard let date = dateFormatter.date(from: month) else {
            return 0
        }

        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
}

struct MonthGridView_Previews: PreviewProvider {
    static var previews: some View {
        MonthGridView(monthWithHolidays: .init(month: "May", holidays: [.defaultValue]))
    }
}
