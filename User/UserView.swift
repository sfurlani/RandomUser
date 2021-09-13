//
//  UserView.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation
import UIKit
import VIPER

final class UserView: UIViewController, ViewInterface {

    var presenter: UserPresenterViewInterface!

    let userList = UITableView()

    let indicator = UIActivityIndicatorView(style: .large)

    var users: [Any]?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUserList()
        setupIndicator()

        self.presenter.start()
    }

    private func setupUserList() {
        view.addSubview(userList)
        userList.delegate = self
        userList.dataSource = self

        userList.anchorTo(other: view)
        userList.isHidden = true

        // TODO register Cell
    }

    private func setupIndicator() {

        view.addSubview(indicator)
        indicator.hidesWhenStopped = true

    }

}

extension UserView: UserViewPresenterInterface {

    func showLoading() {

        userList.isHidden = true
        indicator.startAnimating()

    }

    func show(users: [Any]) {

        indicator.stopAnimating()
        userList.isHidden = false

        self.users = users
        userList.reloadData()
    }

}

extension UserView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return users.isEmpty ? 1 : 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let users = self.users,
              section == 0
        else {
            return 0
        }

        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "user_cell", for: indexPath)

        // TODO

        return cell
    }

}

class UserRow: UITableViewCell {

    let nameLabel = UILabel()

    func configure(user: Any) {
        // TODO
    }

    ini


}
