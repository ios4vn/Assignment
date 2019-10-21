//
//  AppController.swift
//  Assignment
//
//  Created by PENANDCOFFEE on 10/18/19.
//  Copyright © 2019 ios4vn. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

struct NotificationKeys {
    static let userDidLogin = "UserDidLogin"
    static let userDidLogout = "UserDidLogout"
}

struct UserInfoKeys {
    static let profile = "profile"
}

class AppController: NSObject {

    private var profileViewController: ProfileViewController!
    private weak var loginViewController: LoginViewController?

    func appDidFinishLaunching(with window: UIWindow?) {
        guard let controller = window?.rootViewController as? ProfileViewController else {
            fatalError("App must be root setup with a profile view controller")
        }
        profileViewController = controller
        notificationCenter.addObserver(self, selector: #selector(userDidLogin(_ :)), name: Notification.Name(rawValue: NotificationKeys.userDidLogin), object: nil)
        notificationCenter.addObserver(self, selector: #selector(userDidLogout), name: Notification.Name(rawValue: NotificationKeys.userDidLogout), object: nil)
    }

    @objc private func userDidLogin(_ notification: Notification) {
        guard let userInfo = notification.userInfo, let profile = userInfo[UserInfoKeys.profile] as? Profile else {
            return
        }
        finishLogin(profile: profile)
    }

    @objc private func userDidLogout() {
        showLogin(animated: true)
    }

    func showLogin(animated: Bool) {
        guard let controller = R.storyboard.main.loginViewController() else { return }
        loginViewController = controller
        self.profileViewController.present(controller, animated: animated, completion: nil)
    }

    func appDidBecomeActive() {
        if AccessToken.current == nil && loginViewController == nil {
            showLogin(animated: false)
        } else {
            guard let realmProfile = RealmManager.shared.getProfile() else {
                return
            }
            profileViewController.profile = realmProfile.convert()
        }
    }

    func finishLogin(profile: Profile) {
        profileViewController.profile = profile
        profileViewController.presentedViewController?.dismiss(animated: true)
    }

}
