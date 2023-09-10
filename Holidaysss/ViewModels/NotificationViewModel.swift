//
//  NotificationViewModel.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 10-09-23.
//

import Foundation
import SwiftUI

class NotificationViewModel: ObservableObject {

    private let notificaitonUsesCase: NotificationUsesCase
    private var notificationManager = NotificationManager()
    @Published var isNotificationActive = false

    init(notificaitonUsesCase: NotificationUsesCase) {
        self.notificaitonUsesCase = notificaitonUsesCase
    }

    func handleNotificationTap(for holiday: Holiday) {
        self.notificaitonUsesCase.requestNotificationPermission { [weak self] userAccepted in
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
