//
//  HolidayCell.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 04-09-23.
//

import SwiftUI

struct HolidayCell: View {

    let holiday: Holiday

    var body: some View {
        HStack {
            VStack {
                Spacer(minLength: 5)
                Text(holiday.date.dateDetails()!.weekday)
                    .font(.system(size: 15, weight: .light))
                Spacer(minLength: 0)
                Text(String(holiday.date.dateDetails()!.day))
                    .font(.system(size: 75, weight: .bold))
                    .padding(10)
                Spacer(minLength: 0)
                Text(holiday.date.dateDetails()!.month)
                    .font(.system(size: 15, weight: .thin))
                Spacer(minLength: 5)
            }
            .frame(width: 130)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(holiday.name)
                    .font(.headline)
                    .padding(.leading)
                if holiday.isEssential == "1"{
                    Text("Irrenunciable")
                        .font(.caption)
                        .padding(4)
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                        .padding(.leading)
                }
                Spacer()
                if let coundown = holiday.getCountdown() {
                    Text(coundown)
                        .font(.footnote)
                        .padding(.leading)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
        }
        .frame(height: 150)
    }
}

struct HolidayCell_Previews: PreviewProvider {
    static var previews: some View {
        HolidayCell(holiday: Holiday(name: "Dia de las Glorias Navales", comments: "", date: "2023-12-09", isEssential: "1", type: "Civil"))
    }
}
