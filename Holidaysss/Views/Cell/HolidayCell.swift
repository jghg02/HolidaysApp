//
//  HolidayCell.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 04-09-23.
//

import SwiftUI

struct HolidayCell: View {

    let holiday: Holiday
    var isNextHoliday: Bool

    @State private var isBorderAnimated = false
    @State private var isNotificationActive = false
    @ObservedObject private var toastViewModel = ToastViewModel()
    @ObservedObject private var notificationViewModel: NotificationViewModel =
    NotificationViewModel(notificaitonUsesCase:
                            NotificationUsesCase(repository:
                                                    NotificationRepositoryImpl(notificationManager:
                                                                                NotificationManager())))


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
            .overlay(
                Group {
                    if isNextHoliday {
                        /// TODO
                        /// The animation might be stopping when you scroll because the onAppear modifier is
                        /// called again when the view appears after scrolling, and it sets isBorderAnimated
                        /// to true again, which interrupts the ongoing animation.
                        /// The onAppear { isBorderAnimated = true } is over VStack
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isBorderAnimated ? Color.blue : Color.orange, lineWidth: 2)
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true), value: isBorderAnimated)
                    }
                }
            )
            .onAppear {
                isBorderAnimated = true
            }


            VStack(alignment: .leading) {
                Text(holiday.name)
                    .font(.headline)
                    .padding(.leading)
                if holiday.isEssential == "1"{
                    Text("inalienable".localized)
                        .font(.caption)
                        .padding(4)
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                        .padding(.leading)
                }

                if let coundown = holiday.getCountdown() {
                    Spacer()
                    Text(coundown)
                        .font(.footnote)
                        .padding(.leading)
                        .foregroundColor(.blue)
                }

                Spacer()
                Spacer()

                /*
                if holiday.getCountdown() != "passed".localized {
                    HStack {
                        Button {
                            if !self.notificationViewModel.isNotificationActive {
                                self.notificationViewModel.handleNotificationTap(for: self.holiday)
                            } else {
                                self.notificationViewModel.removeNotification(for: self.holiday)
                            }


                        } label: {
                            Image(systemName: self.notificationViewModel.isNotificationActive ?
                                  "person.2.wave.2.fill" : "person.2.wave.2")
                            .padding() // Add padding to increase tappable area
                        }
                    }
                }
                 */
            }
        }
        .frame(height: 170)
        .onAppear {
            if isNextHoliday {
                isBorderAnimated = true
            }
        }
        .overlay(
            // ToastView overlay
            Group {
                if toastViewModel.showToast {

                }
            }
                .padding(.bottom), alignment: .bottom
        )
    }
}

struct HolidayCell_Previews: PreviewProvider {
    static var previews: some View {
        HolidayCell(holiday: Holiday(name: "Dia de las Glorias Navales", comments: "", date: "2023-11-09", isEssential: "1", type: "Civil"), isNextHoliday: true)
    }
}
