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

    typealias UserListDiffableDataSource = UITableViewDiffableDataSource<Int, UserRow.Configuration>
    typealias UserListSnapshot = NSDiffableDataSourceSnapshot<Int, UserRow.Configuration>

    var presenter: UserPresenterViewInterface!

    private let userList = UITableView()
    private var dataSource: UserListDiffableDataSource!

    private let indicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Random Users"

        setupView()
        setupUserList()
        setupIndicator()

        self.presenter.start()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
    }

    private func setupUserList() {
        view.addSubview(userList)
        userList.delegate = self
        userList.rowHeight = UITableView.automaticDimension
        userList.estimatedRowHeight = 48

        dataSource = UserListDiffableDataSource(tableView: userList, cellProvider: UserRow.provider(tableView:indexPath:config:))

        userList.anchorTo(other: view)
        userList.isHidden = true

        userList.register(UserRow.self, forCellReuseIdentifier: UserRow.reuseIdentifier)
    }

    private func setupIndicator() {

        view.addSubview(indicator)
        indicator.centerTo(other: view)
        indicator.hidesWhenStopped = true

    }

}

extension UserView: UserViewPresenterInterface {

    func showLoading() {

        userList.isHidden = true
        indicator.startAnimating()

    }

    func show(users: [UserEntity]) {

        indicator.stopAnimating()
        userList.isHidden = false

        let configs = users.map(UserRow.Configuration.init(user:))
        var snapshot = UserListSnapshot()
        snapshot.appendSections([1])
        snapshot.appendItems(configs, toSection: 1)

        dataSource.apply(snapshot)
    }

    func show(error: Error) {
        // TODO
        print(error)
    }

    func deselectAll() {
        guard let selectedRows = userList.indexPathsForSelectedRows else {
            return
        }

        selectedRows.forEach { self.userList.deselectRow(at: $0, animated: true)}
    }

}

extension UserView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let config = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        presenter.showDetail(user: config.user)
    }

}

class UserRow: UITableViewCell {

    static let reuseIdentifier = "user_cell"

    static func provider(tableView: UITableView, indexPath: IndexPath, config: Configuration) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserRow.reuseIdentifier, for: indexPath)
        cell.contentConfiguration = config
        return cell
    }

    struct Configuration: UIContentConfiguration, Hashable {

        let user: UserEntity
        var isSelected: Bool = false

        init(user: UserEntity) {
            self.user = user
        }

        func makeContentView() -> UIView & UIContentView {
            return ContentView(self)
        }

        func updated(for state: UIConfigurationState) -> Configuration {
            var config = self
            if let state = state as? UICellConfigurationState {
                config.isSelected = state.isSelected
            }
            return config
        }


        static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.user == rhs.user
        }

        func hash(into hasher: inout Hasher) {
            return hasher.combine(user)
        }
    }

    class ContentView: UIView, UIContentView {

        var configuration: UIContentConfiguration

        let nameLabel = UILabel()

        init(_ config: UIContentConfiguration) {
            self.configuration = config
            super.init(frame: .zero)
            setupNameLabel()
            configure(config)
        }

        private func setupNameLabel() {
            addSubview(nameLabel)
            nameLabel.anchorToSuperview(edgeInsets: .init(top: 8, leading: 16, bottom: 8, trailing: 16))
            nameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

            nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        }

        // unused by the configuration API (but might be later by the restoration API if we set it up)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func configure(_ configuration: UIContentConfiguration) {
            guard let config = configuration as? Configuration else {
                assertionFailure("Applied Wrong Configuration: \(configuration) - expected: \(Configuration.self)")
                return
            }

            nameLabel.text = config.user.name.first
            nameLabel.textColor = config.isSelected ? .red : .black
        }
    }
}





