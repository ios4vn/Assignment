//
//  AppDelegate.swift
//  Assignment
//
//  Created by PENANDCOFFEE on 10/18/19.
//  Copyright © 2019 ios4vn. All rights reserved.
//

import UIKit
import FacebookCore

let notificationCenter = NotificationCenter.default

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let appController = AppController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appController.appDidFinishLaunching(with: window)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        appController.appDidBecomeActive()

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return SDKApplicationDelegate.shared.application(app, open: url, options: options)
    }

}
