//
//  Dictionary+Extensions.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 20-09-23.
//

import Foundation

extension Dictionary where Key == String, Value == String {
    static var holidayURLs: [String: String] {
        return [
            "Año Nuevo": "https://es.wikipedia.org/wiki/A%C3%B1o_Nuevo",
            "Feriado Adicional": "https://shorturl.at/bdgTW",
            "Viernes Santo": "https://es.wikipedia.org/wiki/Viernes_Santo",
            "Sábado Santo": "https://es.wikipedia.org/wiki/S%C3%A1bado_Santo",
            "Día Nacional del Trabajo": "https://es.wikipedia.org/wiki/D%C3%ADa_Internacional_de_los_Trabajadores",
            "Día de las Glorias Navales": "https://es.wikipedia.org/wiki/D%C3%ADa_de_las_Glorias_Navales",
            "Día Nacional de los Pueblos Indígenas": "https://www.conadi.gob.cl/dianacionalpueblosindigenas",
            "San Pedro y San Pablo": "https://es.wikipedia.org/wiki/San_Pedro_y_San_Pablo",
            "Día de la Virgen del Carmen": "https://es.wikipedia.org/wiki/Virgen_del_Carmen",
            "Asunción de la Virgen": "https://es.wikipedia.org/wiki/Asunci%C3%B3n_de_Mar%C3%ADa",
            "Independencia Nacional": "https://es.wikipedia.org/wiki/Independencia_de_Chile",
            "Día de las Glorias del Ejército": "https://es.wikipedia.org/wiki/D%C3%ADa_de_las_Glorias_del_Ej%C3%A9rcito_de_Chile",
            "Encuentro de Dos Mundos": "https://es.wikipedia.org/wiki/Descubrimiento_de_Am%C3%A9rica",
            "Día de las Iglesias Evangélicas y Protestantes": "https://es.wikipedia.org/wiki/D%C3%ADa_Nacional_de_las_Iglesias_Evang%C3%A9licas_y_Protestantes",
            "Día de Todos los Santos": "https://es.wikipedia.org/wiki/D%C3%ADa_de_Todos_los_Santos",
            "Inmaculada Concepción": "https://es.wikipedia.org/wiki/Inmaculada_Concepci%C3%B3n",
            "Navidad": "https://es.wikipedia.org/wiki/Navidad"
        ]
    }

    static func url(forHolidayName holidayName: String) -> String? {
        return Self.holidayURLs[holidayName]
    }
}

