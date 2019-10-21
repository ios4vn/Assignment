//
//  RealmManager.swift
//  Assignment
//
//  Created by PENANDCOFFEE on 10/18/19.
//  Copyright © 2019 ios4vn. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager {

    private let realm = try! Realm()

    static let shared = RealmManager()

    func getProfile() -> RealmProfile? {
        let profiles = realm.objects(RealmProfile.self)
        return profiles.first
    }

    func persit(_ profile: Profile) {
        let realmProfile = RealmProfile(profile)
        try! realm.write {
            realm.add(realmProfile)
        }
    }

    func clear() {
        try! realm.write {
            let profiles = realm.objects(RealmProfile.self)
            realm.delete(profiles)
        }
    }

}
