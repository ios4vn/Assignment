//
//  ProfileViewControllerTests.swift
//  AssignmentTests
//
//  Created by PENANDCOFFEE on 10/22/19.
//  Copyright © 2019 ios4vn. All rights reserved.
//

import XCTest
@testable import Assignment

class ProfileViewControllerTests: XCTestCase {

    var sut: ProfileViewController!

    override func setUp() {
        super.setUp()
        guard let profileViewController = R.storyboard.main.profileViewController() else {
            fatalError("Profile View Controller doesn't exit")
        }
        sut = profileViewController
        _ = sut.view
    }

    func test_hasTableView() {
        XCTAssertNotNil(sut.tableView, "Table view doesn't exist")
    }

    func test_bindData() {
        sut.profile = nil
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        sut.profile = Profile(identifier: UUID().uuidString, name: "Test User", birthday: "01/01/2001", email: "test@gmail.com")
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 4)
        XCTAssertEqual(sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.detailTextLabel?.text, sut.profile?.identifier)
        XCTAssertEqual(sut.tableView.cellForRow(at: IndexPath(row: 1, section: 0))?.detailTextLabel?.text, sut.profile?.name)
        XCTAssertEqual(sut.tableView.cellForRow(at: IndexPath(row: 2, section: 0))?.detailTextLabel?.text, sut.profile?.birthday)
        XCTAssertEqual(sut.tableView.cellForRow(at: IndexPath(row: 3, section: 0))?.detailTextLabel?.text, sut.profile?.email)
    }

}
