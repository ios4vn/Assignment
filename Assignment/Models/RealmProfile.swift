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

    dynamic var identifier: String = ""
    dynamic var name: String = ""
    dynamic var birthday: Date = Date()
    dynamic var email: String = ""
    
}
