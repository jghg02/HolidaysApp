//
//  HolidayListView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 04-09-23.
//

import SwiftUI

struct HolidayListView: View {
    
    let holidays: [Holiday]
    let nextHoliday: Holiday
    
    
    var body: some View {
        ScrollViewReader { scrollView in
            List(holidays, id: \.id) { current in
                HolidayCell(holiday: current,
                            isNextHoliday: current.id == self.nextHoliday.id)
            }
            .onChange(of: self.nextHoliday) { newNextHoliday in
                withAnimation(.easeInOut(duration: 5.0)) {
                    scrollView.scrollTo(newNextHoliday.id, anchor: .top)
                }
            }
        }
    }
}



struct HolidayListView_Previews: PreviewProvider {
    static var previews: some View {
        HolidayListView(holidays: [Holiday(name: "NAME", comments: "COMMENTS", date: "2023-05-02", isEssential: "true", type: "Type")], nextHoliday: .init(name: "NAME", comments: "COMMENTS", date: "2023-05-02", isEssential: "true", type: "Type"))
    }
}
