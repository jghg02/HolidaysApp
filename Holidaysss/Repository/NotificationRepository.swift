//
//  NotificationRepository.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 10-09-23.
//

import Foundation
import NotificationCenter

protocol NotificationRepository {
    func requestNotificationPermission(completion: @escaping (Bool) -> Void)
    func removeNotification(by holiday: Holiday)
}

class NotificationRepositoryImpl: NotificationRepository {

    private let notificationManager: NotificationManager

    init(notificationManager: NotificationManager) {
        self.notificationManager = notificationManager
    }

    func requestNotificationPermission(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                completion(true)
            } else {
                completion(false)
                // Here, log the error or send it to a logging server
                if let error = error {
                    print("Failed to grant notification permissions: \(error.localizedDescription)")
                }
            }
        }
    }

    func removeNotification(by holiday: Holiday) {
        self.notificationManager.cancelNotification(for: holiday)
    }

}
