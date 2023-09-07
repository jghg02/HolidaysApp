//
//  GetHolidaysUseCase.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 07-09-23.
//

import Foundation

class GetHolidaysUseCase {
    private let repository: HolidayRepository

    init(repository: HolidayRepository) {
        self.repository = repository
    }

    func execute(by year: String) async -> [Holiday] {
        return await self.repository.getAllHoliday(by: year)
    }

    func getNextHoliday(by data: [Holiday]?) -> Holiday? {
        guard let data = data else {
            return nil
        }

        return self.repository.determineNextHoliday(by: data)
    }
    
}
