//
//  Holiday.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 02-09-23.
//

import Foundation

struct Holiday: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let comments: String?
    let date: String
    let isEssential: String
    let type: String
    //    let laws: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "nombre"
        case comments = "comentarios"
        case date = "fecha"
        case isEssential = "irrenunciable"
        case type = "tipo"
        //        case laws = "leyes"
    }
    
}

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

        return dayCount > 0 ? "\(dayCount) days left" : dayCount == 0 ? "Today" : "Passed"
    }

}
