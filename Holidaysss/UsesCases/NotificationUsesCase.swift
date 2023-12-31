//
//  NotificationUsesCase.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 10-09-23.
//

import Foundation

class NotificationUsesCase {
    private let repository: NotificationRepository

    init(repository: NotificationRepository) {
        self.repository = repository
    }

    func requestNotificationPermission(completion: @escaping (Bool) -> Void) {
        self.repository.requestNotificationPermission(completion: completion)
    }

    func scheduleNotification(by holiday: Holiday, completion: @escaping (Bool) -> Void) {
        self.repository.scheduleNotification(by: holiday, completion: completion)
    }

    func removeNotification(by data: Holiday) {
        self.repository.removeNotification(by: data)
    }

}
