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

    @State private var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    @State private var selectedHoliday: Holiday?

    init()  {
        self.viewModel = HolidayViewModel(getHolidaydUseCase: GetHolidaysUseCase(repository: HolidayRepositoryImp()))
    }

    var body: some View {
        Group {
            if UIDevice.isPad() {
                // iPad
                NavigationSplitView(columnVisibility: $columnVisibility) {
                    HolidayListView(holidays: self.viewModel.holidays,
                                    nextHoliday: self.viewModel.nextHoliday ?? Holiday.defaultValue,
                                    selectedHoliday: $selectedHoliday)
                    .navigationTitle("holidays".localized)
                    .task {
                        await self.viewModel.getAllHolidays(by: dateViewModel.currentYear)
                        self.viewModel.getNextHoliday()
                        selectedHoliday = self.viewModel.nextHoliday
                    }
                } detail: {
                    WebView(url: URL(string: self.selectedHoliday?.url ?? "https://www.google.com")!)
                        .navigationTitle(self.selectedHoliday?.name ?? "")
                }
                // This style reduces the size of the detail view to make
                // room to show the leading column(s) side-by-side
                .navigationSplitViewStyle(.balanced)
            } else {
                // iPhone
                HolidayListView(holidays: self.viewModel.holidays,
                                nextHoliday: self.viewModel.nextHoliday ?? Holiday.defaultValue,
                                selectedHoliday: $selectedHoliday)
                .navigationTitle("holidays".localized)
                .embedNavigationView()
                .task {
                    await self.viewModel.getAllHolidays(by: dateViewModel.currentYear)
                    self.viewModel.getNextHoliday()
                }

            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DateViewModel())
    }
}

