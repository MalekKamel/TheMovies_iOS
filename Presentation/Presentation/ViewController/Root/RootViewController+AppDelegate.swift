//
// Created by mac on 2019-07-02.
// Copyright (c) 2019 sulfa. All rights reserved.
//

import UIKit

public extension RootViewController {

    func application(willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    }

    func application(didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

    }

    func applicationDidEnterForeground(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
    }

    func application(
            _ app: UIApplication,
            open url: URL,
            options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) {
    }

    func application(
            _ application: UIApplication,
            continue userActivity: NSUserActivity,
            restorationHandler: @escaping ([UIUserActivityRestoring]?
            ) -> Void) -> Bool {
         false
    }

    func application(
            _ application: UIApplication,
            didChangeStatusBarFrame oldStatusBarFrame: CGRect
    ) {
        UIView.animate(withDuration: 0.3) { self.window.rootViewController?.view.frame = self.window.frame }
    }

}
