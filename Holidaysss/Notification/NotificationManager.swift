//
//  NotificationManager.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 05-09-23.
//

import SwiftUI
import NotificationCenter


class NotificationManager: ObservableObject {

    private var notificationIndetifier: String = ""
    @Published var showToastView: Bool = false

    func requestNotificationPermissions(by data: Holiday) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] success, error in
            if success {
                print("Notification permissions granted")
                self?.scheduleNotification(by: data)
            } else if let error = error {
                print("Failed to grant notification permissions: \(error.localizedDescription)")
                // Here, consider providing user-facing error messages
            }
        }
    }


    func scheduleNotificationQuick(by data: Holiday) {
        let content = UNMutableNotificationContent()
        content.title = NSLocalizedString(data.name, comment: data.name)
        content.subtitle = NSLocalizedString("Chill...🍻", comment: data.date)
        content.sound = UNNotificationSound.default

        notificationIndetifier = UUID().uuidString

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: notificationIndetifier, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error.localizedDescription)")
                // Here, consider providing user-facing error messages
            }
        }
    }

    func scheduleNotification(by data: Holiday) {
        let content = UNMutableNotificationContent()
        content.title = NSLocalizedString(data.name, comment: data.name)
        content.subtitle = NSLocalizedString("🇨🇱", comment: data.date)
        content.sound = UNNotificationSound.default

        // Step 1: Convert your date string to a Date object
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Assuming your date format is like this
        guard let date = dateFormatter.date(from: data.date) else {
            print("Failed to parse date string")
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

        notificationIndetifier = UUID().uuidString

        let request = UNNotificationRequest(identifier: notificationIndetifier, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error.localizedDescription)")
                // Here, consider providing user-facing error messages
            }
            // TODO: 
            // At this moment I need to show the ToatView I mean change the value for showToastView
        }
        getAllPendingNotifications { current in
            print(current)
        }
    }

    func cancelNotification(for data: Holiday) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [notificationIndetifier])
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
