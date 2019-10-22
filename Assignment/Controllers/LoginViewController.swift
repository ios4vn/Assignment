//
//  LoginViewController.swift
//  Assignment
//
//  Created by PENANDCOFFEE on 10/18/19.
//  Copyright © 2019 ios4vn. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController {

    // MARK: Private functions
    @IBAction private func loginWithReadPermissions() {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.email, .publicProfile, .userBirthday], viewController: self) { result in
            DispatchQueue.main.async { [weak self] in
                self?.loginManagerDidComplete(result)
            }
        }
    }

    private func loginManagerDidComplete(_ result: LoginResult) {
        switch result {
        case .cancelled:
            alert(title: "Login Cancelled", message: "User cancelled login.")
        case .failed(let error):
            alert(title: "Login Fail", message: "Login failed with error \(error)")
        case .success:
            fetchUserProfile()
        }
    }

    private func alert(title: String, message: String) {
        let alertController = UIAlertController(title: "Login Cancelled", message: "User cancelled login.", preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(doneAction)
        self.present(alertController, animated: true, completion: nil)
    }

    private func fetchUserProfile() {
        let request = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, birthday"])

        request.start { (_, result) in
            switch result {
            case .failed(let error):
                print(error)
            case .success(let response):
                if let dictionaryResponse = response.dictionaryValue {
                    let identifier = dictionaryResponse["id"] as? String
                    let name = dictionaryResponse["name"] as? String
                    let email = dictionaryResponse["email"] as? String
                    let birthday = dictionaryResponse["birthday"] as? String
                    let profile = Profile(identifier: identifier, name: name, birthday: birthday, email: email)
                    RealmManager.shared.persist(profile)
                    notificationCenter.post(name: Notification.Name(rawValue: NotificationKeys.userDidLogin), object: nil, userInfo: [UserInfoKeys.profile: profile])
                }
            }
        }
    }

}
