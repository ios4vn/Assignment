//
//  RealmProfile.swift
//  Assignment
//
//  Created by PENANDCOFFEE on 10/18/19.
//  Copyright © 2019 ios4vn. All rights reserved.
//

import UIKit
import RealmSwift

class RealmProfile: Object {

    @objc dynamic var identifier: String?
    @objc dynamic var name: String?
    @objc dynamic var birthday: String?
    @objc dynamic var email: String?

    convenience init(_ profile: Profile) {
        self.init()
        identifier = profile.identifier
        name = profile.name ?? ""
        birthday = profile.birthday ?? ""
        email = profile.email ?? ""
    }

    func convert() -> Profile {
        return Profile(identifier: identifier, name: name, birthday: birthday, email: email)
    }
}
