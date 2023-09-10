//
//  NotificationViewModel.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 10-09-23.
//

import Foundation
import SwiftUI

class NotificationViewModel: ObservableObject {

    private let notificatitonUsesCase: NotificationUsesCase
    private var notificationManager = NotificationManager()
    @Published var isNotificationActive = false

    init(notificaitonUsesCase: NotificationUsesCase) {
        self.notificatitonUsesCase = notificaitonUsesCase
    }

    func removeNotification(for holiday: Holiday) {
        self.notificatitonUsesCase.removeNotification(by: holiday)
        self.isNotificationActive = false
    }

    func handleNotificationTap(for holiday: Holiday) {
        self.notificatitonUsesCase.requestNotificationPermission { [weak self] userAccepted in
            guard let self = self else { return }
            if userAccepted {
                self.notificationManager.scheduleNotification(by: holiday) { isScheduled in
                    if isScheduled {
                        DispatchQueue.main.async {
                            self.isNotificationActive = true
                        }
                    } else {
                        // Handle the error case
                        DispatchQueue.main.async {
                            self.isNotificationActive = false
                        }
                    }
                }
            } else {
                // Handle the case where the user declined the permissions
                DispatchQueue.main.async {
                    self.isNotificationActive = false
                }
            }
        }
    }
    
}
