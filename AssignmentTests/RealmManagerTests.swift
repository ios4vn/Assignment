//
//  RealmManagerTests.swift
//  AssignmentTests
//
//  Created by PENANDCOFFEE on 10/23/19.
//  Copyright © 2019 ios4vn. All rights reserved.
//

import XCTest
@testable import Assignment

class RealmManagerTests: XCTestCase {

    // Test create, read, delete
    func test_CRD() {
        RealmManager.shared.clear()
        let emptyProfile = RealmManager.shared.getProfile()
        XCTAssertNil(emptyProfile)
        let profile = Profile(identifier: UUID().uuidString, name: "Test User", birthday: "01/01/2001", email: "test@gmail.com")
        RealmManager.shared.persist(profile)
        let nonEmptyProfile = RealmManager.shared.getProfile()
        XCTAssertNotNil(nonEmptyProfile)
        XCTAssertEqual(nonEmptyProfile?.identifier, profile.identifier)
        XCTAssertEqual(nonEmptyProfile?.name, profile.name)
        XCTAssertEqual(nonEmptyProfile?.birthday, profile.birthday)
        XCTAssertEqual(nonEmptyProfile?.email, profile.email)
    }
}
