//
//  HolidayRepository.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 07-09-23.
//

import Foundation
import NET

protocol HolidayRepository {
    func getAllHoliday(by year: String) async -> [Holiday]
    func determineNextHoliday(by data: [Holiday]) -> Holiday?
}


class HolidayRepositoryImp: HolidayRepository {

    private let dateVM = DateViewModel()

    func getAllHoliday(by year: String) async -> [Holiday] {

        guard let url = URL.holidaysURL(by: year) else {
            return []
        }

        let client = NETClient<[Holiday], NETEmpty>()
        let request = NETRequest(url: url)

        switch await client.request(request) {
        case .success(let data):
            return data.value
        case .failure(let error):
            print(error.localizedDescription)
            return []
        }
    }

    func determineNextHoliday(by data: [Holiday]) -> Holiday? {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd"
        let currentDataString = formater.string(from: dateVM.currentDate)

        if let nextHoliday = data
            .filter({ $0.date > currentDataString })
            .min(by: { $0.date < $1.date }) {
            return nextHoliday
        }

        return nil
    }
    
}
