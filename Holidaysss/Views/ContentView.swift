//
//  ContentView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 01-09-23.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var vm: HolidayViewModel
    @EnvironmentObject var dateViewModel: DateViewModel

    init()  {
        self.vm = HolidayViewModel()
    }

    var body: some View {

        HolidayListView(holidays: self.vm.holidays, holidayVM: self.vm)
            .navigationTitle("holidays".localized)
            .embedNavigationView()
            .task {
                await self.vm.getAllHolidays()
            }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DateViewModel())
    }
}

