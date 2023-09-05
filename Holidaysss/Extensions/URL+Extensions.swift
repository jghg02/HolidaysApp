//
//  URL+Extensions.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 03-09-23.
//

import Foundation

extension URL {

    static func holidaysURL(by year: String) -> URL? {
        return URL(string: "https://apis.digital.gob.cl/fl/feriados/\(year)")
    }
}
