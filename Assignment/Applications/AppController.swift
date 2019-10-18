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

class AppController: NSObject {
    
    private var rootViewController: ProfileViewController!
    private weak var loginViewController: LoginViewController?
    
    func appDidFinishLaunching(with window: UIWindow?) {
        guard let controller = window?.rootViewController as? ProfileViewController else {
            fatalError("App must be root setup with a profile view controller")
        }
        rootViewController = controller
        if AccessToken.current != nil {
            // User is logged in, use 'accessToken' here.
        } else {
            
        }
    }

}
