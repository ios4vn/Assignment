//
//  ViewController.swift
//  Assignment
//
//  Created by PENANDCOFFEE on 10/18/19.
//  Copyright © 2019 ios4vn. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin

enum RowType: Int, CaseIterable {
    case identifier = 0
    case name
    case birthday
    case email

    func title() -> String {
        switch self {
        case .identifier:
            return "Id"
        case .name:
            return "Name"
        case .birthday:
            return "Birthday"
        case .email:
            return "Email"
        }
    }

    func info(for profile: Profile) -> String {
        switch self {
        case .identifier:
            return profile.identifier ?? "Unknown"
        case .name:
            return profile.name ?? "Unknown"
        case .birthday:
            return profile.birthday ?? "Unknown"
        case .email:
            return profile.email ?? "Unknown"
        }
    }
}

class ProfileViewController: UIViewController {

    static let reuseIdentifier = "ProfileCell"

    var profile: Profile? {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView!

    @IBAction func logOutAction(_ sender: UIButton) {
        LoginManager().logOut()
        RealmManager.shared.clear()
        notificationCenter.post(name: Notification.Name(rawValue: NotificationKeys.userDidLogout), object: nil)
    }

}

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.profile != nil {
            return RowType.allCases.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: ProfileViewController.reuseIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1,
                                   reuseIdentifier: ProfileViewController.reuseIdentifier)
        }
        if let profile = self.profile {
            let rowType: RowType = RowType(rawValue: indexPath.row) ?? .identifier
            cell?.textLabel?.text = rowType.title()
            cell?.detailTextLabel?.text = rowType.info(for: profile)
        }
        return cell!
    }

}
