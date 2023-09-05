//
//  HolidayListView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 04-09-23.
//

import SwiftUI

struct HolidayListView: View {

    let holidays: [Holiday]
    var scrollToNextHoliday: (() -> Void)?
    @ObservedObject var holidayVM: HolidayViewModel

    var body: some View {
        ScrollViewReader { scrollView in
            List(holidays, id: \.id) { current in
                HolidayCell(holiday: current)
            }
            .onChange(of: holidayVM.nextHoliday) { newNextHoliday in
                if let nextHoliday = newNextHoliday {
                    withAnimation(.easeInOut(duration: 3.0)) {
                        scrollView.scrollTo(nextHoliday.id, anchor: .top)
                    }
                }
            }
        }
    }
}



struct HolidayListView_Previews: PreviewProvider {
    static var previews: some View {
        HolidayListView(holidays: [Holiday(name: "NAME", comments: "COMMENTS", date: "2023-05-02", isEssential: "true", type: "Type")], holidayVM: HolidayViewModel())
    }
}
