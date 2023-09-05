//
//  HolidayViewModel.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 02-09-23.
//


import Foundation
import SwiftUI
import NET

class HolidayViewModel: ObservableObject {

    @Published var holidays: [Holiday]
    @Published var nextHoliday: Holiday?
    private var dateVM: DateViewModel

    init(holidays: [Holiday] = []) {
        self.holidays = holidays
        self.dateVM = DateViewModel()
    }

    func getAllHolidays() async {
        guard let url = URL.holidaysURL(by: self.dateVM.currentYear) else {
            return
        }

        let client = NETClient<[Holiday], NETEmpty>()
        let request = NETRequest(url: url)

        switch await client.request(request) {
        case .success(let data):
            DispatchQueue.main.async {
                self.holidays = data.value
            }
            self.determineNextHoliday(by: data.value)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }

    func determineNextHoliday(by data: [Holiday]) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDateString = formatter.string(from: self.dateVM.currentDate)

        if let nextHoliday = data
            .filter({ $0.date > currentDateString })
            .min(by: { $0.date < $1.date }) {
            DispatchQueue.main.async {
                self.nextHoliday = nextHoliday
            }
        }
    }

}
