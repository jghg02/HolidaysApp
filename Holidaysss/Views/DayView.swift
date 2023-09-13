//
//  DayView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 12-09-23.
//

import SwiftUI

struct DayView: View {
    let day: String
    let isHoliday: Bool

    var body: some View {
        Text(day)
            .frame(width: 30, height: 30)
            .background(isHoliday ? Color.red : Color.clear)
            .cornerRadius(15)
            .padding(5)
    }
}
struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(day: "Lunes", isHoliday: true)
    }
}
