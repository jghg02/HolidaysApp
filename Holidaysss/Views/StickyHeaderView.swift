//
//  StickyHeaderView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 04-09-23.
//

import SwiftUI

struct StickyHeaderView: View {
    @Binding var nextHoliday: Holiday?

    var body: some View {
        VStack {
            if let nextHoliday = nextHoliday {
                Text("Next Holiday: \(nextHoliday.name)")
                // Add a countdown timer here
                // ...
            } else {
                Text("No upcoming holidays")
            }
        }
    }
}


