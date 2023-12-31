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

    @State private var showModalConfig: Bool = false
    @State private var sheetHeight: CGFloat = .zero

    init() {
        self.viewModel = HolidayViewModel(getHolidaydUseCase: GetHolidaysUseCase(repository: HolidayRepositoryImp(dateVM: DateViewModel())))
    }

    var body: some View {
        Group {
            if UIDevice.isPad() {
                // iPad
                if self.viewModel.loadingState == .success {
                    NavigationSplitView(columnVisibility: $columnVisibility) {
                        HolidayListView(holidays: self.viewModel.holidays,
                                        nextHoliday: self.viewModel.nextHoliday ?? Holiday.defaultValue,
                                        selectedHoliday: $selectedHoliday)
                        .navigationTitle("holidays".localized)
                    } detail: {
                        WebView(url: URL(string: self.selectedHoliday?.url ?? "https://www.google.com")!)
                            .navigationTitle(self.selectedHoliday?.name ?? "")
                    }
                    // This style reduces the size of the detail view to make
                    // room to show the leading column(s) side-by-side
                    .navigationSplitViewStyle(.balanced)
                    .task {
                        self.viewModel.getNextHoliday()
                        selectedHoliday = self.viewModel.nextHoliday
                    }
                } else if self.viewModel.loadingState == .error {
                    ErrorView()
                } else if self.viewModel.loadingState == .loading {
                    LoadingView()
                }
            } else {
                // iPhone
                if self.viewModel.loadingState == .success {
                    HolidayListView(holidays: self.viewModel.holidays,
                                    nextHoliday: self.viewModel.nextHoliday ?? Holiday.defaultValue,
                                    selectedHoliday: $selectedHoliday)
                    .navigationTitle("holidays".localized)
                    .navigationBarItems(trailing:
                                            Button(action: {
                        // SHoe the config modal
                        self.showModalConfig.toggle()
                    }) {
                        Image(systemName: "gear")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    // Sheet modal config
                    .sheet(isPresented: $showModalConfig, content: {
                        ConfigModalView()
                    })
                    .modifier(GetHeightModifier(height: $sheetHeight))
                    .embedNavigationView()
                    .task {
                        self.viewModel.getNextHoliday()
                    }
                } else if self.viewModel.loadingState == .error {
                    ErrorView()
                } else if self.viewModel.loadingState == .loading {
                    LoadingView()
                }
            }
        }
        .task {
            await self.viewModel.getAllHolidays(by: dateViewModel.currentYear)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DateViewModel())
    }
}

