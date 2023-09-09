//
//  ContentView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 01-09-23.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var dateViewModel: DateViewModel
    @ObservedObject  private var viewModel: HolidayViewModel

    // Notification Manager
    @ObservedObject private var notificationManager = NotificationManager()

    init()  {
        self.viewModel = HolidayViewModel(getHolidaydUseCase: GetHolidaysUseCase(repository: HolidayRepositoryImp()))
    }

    var body: some View {
        HolidayListView(holidays: self.viewModel.holidays,
                        nextHoliday: self.viewModel.nextHoliday ?? Holiday.defaultValue)
            .navigationTitle("holidays".localized)
            .embedNavigationView()
            .task {
                await self.viewModel.getAllHolidays(by: dateViewModel.currentYear)
                self.viewModel.getNextHoliday()
            }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DateViewModel())
    }
}

