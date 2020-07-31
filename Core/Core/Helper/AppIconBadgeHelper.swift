//
// Created by mac on 2019-07-02.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit
import UserNotifications

class AppIconBadgeHelper {

    func didReceive(response: UNNotificationResponse,
                    withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        UIApplication.shared.applicationIconBadgeNumber -= 1
        guard response.actionIdentifier == UNNotificationDefaultActionIdentifier
                else { return } //Notification was opened by the user
        completionHandler()
    }

    func willPresent(
            notification: UNNotification,
            withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        UIApplication.shared.applicationIconBadgeNumber += 1
        completionHandler([.alert, .badge, .sound])
    }
}