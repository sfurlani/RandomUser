//
//  UserPresenter.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation
import VIPER

final class UserPresenter: PresenterInterface {

    var router: UserRouterPresenterInterface!
    var interactor: UserInteractorPresenterInterface!
    weak var view: UserViewPresenterInterface!

}

extension UserPresenter: UserPresenterRouterInterface {

}

extension UserPresenter: UserPresenterInteractorInterface {

    func handleLoadUsers(result: Result<[UserEntity], Error>) {
        switch result {
        case .success(let users):
            view.show(users: users)
        case .failure(let error):
            view.show(error: error)
        }

    }

}

extension UserPresenter: UserPresenterViewInterface {

    func start() {
        view.showLoading()
        interactor.loadUsers()
    }

    func showDetail(user: UserEntity) {
        view.deselectAll()
        router.showDetail(user: user)
    }

}
