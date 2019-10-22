//
//  ProfileTests.swift
//  AssignmentTests
//
//  Created by PENANDCOFFEE on 10/22/19.
//  Copyright © 2019 ios4vn. All rights reserved.
//

import XCTest
@testable import Assignment

class ProfileTests: XCTestCase {

    func test_convert() {
        let profile = Profile(identifier: UUID().uuidString, name: "Test User", birthday: "01/01/2001", email: "test@gmail.com")
        let realmProfile = RealmProfile(profile)
        XCTAssertEqual(realmProfile.identifier, profile.identifier)
        XCTAssertEqual(realmProfile.name, profile.name)
        XCTAssertEqual(realmProfile.birthday, profile.birthday)
        XCTAssertEqual(realmProfile.email, profile.email)
    }

    func test_revert() {
        let realmProfile = RealmProfile()
        realmProfile.identifier = UUID().uuidString
        realmProfile.name = "Test User"
        realmProfile.birthday = "01/01/2001"
        realmProfile.email = "test@gmail.com"
        let profile = realmProfile.convert()
        XCTAssertEqual(profile.identifier, realmProfile.identifier)
        XCTAssertEqual(profile.name, realmProfile.name)
        XCTAssertEqual(profile.birthday, realmProfile.birthday)
        XCTAssertEqual(profile.email, realmProfile.email)
    }
}
