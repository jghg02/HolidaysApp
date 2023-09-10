//
//  NotificationManager.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 05-09-23.
//

import SwiftUI
import NotificationCenter


class NotificationManager: ObservableObject {

    @Published var showToastView: Bool = false

    func requestNotificationPermissions(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Notification permissions granted")
                completion(true)
            } else {
                if let error = error {
                    print("Failed to grant notification permissions: \(error.localizedDescription)")
                }
                completion(false)
            }
        }
    }

    func scheduleNotification(by data: Holiday, completion: @escaping (Bool) -> Void) {
        var data = data
        let content = UNMutableNotificationContent()
        content.title = NSLocalizedString(data.name, comment: data.name)
        content.subtitle = NSLocalizedString("🇨🇱", comment: data.date)
        content.sound = UNNotificationSound.default

        // Step 1: Convert your date string to a Date object
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Assuming your date format is like this
        guard let date = dateFormatter.date(from: data.date) else {
            print("Failed to parse date string")
            completion(false)
            return
        }

        // Step 2: Create DateComponents from the Date
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)

        // Specify the hour and minute for the notification
        components.hour = 10 // Specify the desired hour here
        components.minute = 0 // Specify the desired minute here

        // Step 3: Create a UNCalendarNotificationTrigger with the date components
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        // For test
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

        // store the notification ID into Holiday Struct
        data.notificationId = UUID().uuidString

        let request = UNNotificationRequest(identifier: data.notificationId ?? "", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error.localizedDescription)")
                completion(false) // Notification scheduling failed
            } else {
                // TODO: Show the ToastView here, if necessary
                completion(true) // Notification scheduled successfully
            }
        }
    }

    func cancelNotification(for data: Holiday) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [data.notificationId ?? ""])
        getAllPendingNotifications { current in
            print(current)
        }
        // TODO:
        // At this moment I need to show the ToatView I mean change the value for showToastView
    }

    func getAllPendingNotifications(completion: @escaping ([UNNotificationRequest]) -> ()) {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            completion(requests)
        }
    }
}
