//
//  Holiday+Extensions.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 07-09-23.
//

import Foundation

extension Holiday {
    func getCountdown() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        guard let holidayDate = formatter.date(from: self.date) else {
            return nil
        }

        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local

        // Reset the time components of the current date
        guard let currentDate = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) else {
            return nil
        }

        // Reset the time components of the holiday date
        guard let targetDate = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: holidayDate) else {
            return nil
        }

        let components = calendar.dateComponents([.day], from: currentDate, to: targetDate)

        guard let dayCount = components.day else {
            return nil
        }

        return dayCount > 0 ? "dayLefts".localized(with: dayCount) : dayCount == 0 ? "today".localized : "passed".localized
    }

    static var defaultValue: Holiday {
        .init(name: "", comments: nil, date: "", isEssential: "", type: "")
    }

}
