//
//  Date+Extensions.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 04-09-23.
//

import Foundation

extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
