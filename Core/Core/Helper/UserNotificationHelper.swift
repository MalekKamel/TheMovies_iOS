//
// Created by mac on 2019-07-02.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import Foundation
import UserNotifications

class UserNotificationHelper: NSObject {
    private let badgeHelper = AppIconBadgeHelper()

    func setup() {
        UNUserNotificationCenter.current().delegate = self
    }

    func remove() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

extension UserNotificationHelper: UNUserNotificationCenterDelegate {

    func userNotificationCenter(
            _ center: UNUserNotificationCenter,
            didReceive response: UNNotificationResponse,
            withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        badgeHelper.didReceive(
                response: response,
                withCompletionHandler: completionHandler
        )
    }

    func userNotificationCenter(
            _ center: UNUserNotificationCenter,
            willPresent notification: UNNotification,
            withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        badgeHelper.willPresent(
                notification: notification,
                withCompletionHandler: completionHandler
        )
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                openSettingsFor notification: UNNotification?) {
    }
}