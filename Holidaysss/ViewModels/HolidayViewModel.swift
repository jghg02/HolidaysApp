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

    private let getHolidayUsesCase: GetHolidaysUseCase
    @Published var holidays: [Holiday] = []
    @Published var nextHoliday: Holiday?

    init(getHolidaydUseCase: GetHolidaysUseCase) {
        self.getHolidayUsesCase = getHolidaydUseCase
    }

    func getAllHolidays(by year: String) async {
        self.holidays = await self.getHolidayUsesCase.execute(by: year)
    }

    func getNextHoliday() {
        nextHoliday = self.getHolidayUsesCase.getNextHoliday(by: self.holidays)
    }
}
