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
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: Date(), to: holidayDate)
        
        guard let dayCount = components.day else {
            return nil
        }
        
        return dayCount > 0 ? "\(dayCount) days left" : dayCount == 0 ? "Today" : "Passed"
    }
}
