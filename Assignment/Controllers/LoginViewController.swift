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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func loginWithReadPermissions() {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.email, .publicProfile, .userBirthday], viewController: self) { result in
            self.loginManagerDidComplete(result)
        }
    }

    func loginManagerDidComplete(_ result: LoginResult) {
        let alertController: UIAlertController
        switch result {
        case .cancelled:
            alertController = UIAlertController(title: "Login Cancelled", message: "User cancelled login.", preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
        case .failed(let error):
            alertController = UIAlertController(title: "Login Fail", message: "Login failed with error \(error)", preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
        case .success:
            fetchUserProfile()
        }
    }

    func fetchUserProfile() {
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
                    RealmManager.shared.persit(profile)
                    notificationCenter.post(name: Notification.Name(rawValue: NotificationKeys.userDidLogin), object: nil, userInfo: [UserInfoKeys.profile: profile])
                }
            }
        }
    }

}
