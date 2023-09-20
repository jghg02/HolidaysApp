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

    @State private var columnVisibility =   NavigationSplitViewVisibility.doubleColumn

    init()  {
        self.viewModel = HolidayViewModel(getHolidaydUseCase: GetHolidaysUseCase(repository: HolidayRepositoryImp()))
    }

    var body: some View {
        Group {
            if UIDevice.isPad() {
                // iPad
                NavigationSplitView(columnVisibility: $columnVisibility) {
                    HolidayListView(holidays: self.viewModel.holidays,
                                    nextHoliday: self.viewModel.nextHoliday ?? Holiday.defaultValue)
                    .navigationTitle("holidays".localized)
                    .task {
                        await self.viewModel.getAllHolidays(by: dateViewModel.currentYear)
                        self.viewModel.getNextHoliday()
                    }
                } detail: {
                    WebView(url: URL(string: "https://iosapptemplates.com/blog/ios-development/webview-swiftui")!)
                }
                // This style reduces the size of the detail view to make
                // room to show the leading column(s) side-by-side
                .navigationSplitViewStyle(.balanced)

            } else {
                // iPhone
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
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DateViewModel())
    }
}

