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
    var notificationId: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "nombre"
        case comments = "comentarios"
        case date = "fecha"
        case isEssential = "irrenunciable"
        case type = "tipo"
        case notificationId = "notification"
    }
}
