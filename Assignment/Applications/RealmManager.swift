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
//        let objs = printers.map { RealmPrintRecord(record: $0) }
//        try! realm.write {
//            realm.add(objs, update: true)
//        }
    }
    
    func clear() {
        realm.deleteAll()
    }

}
