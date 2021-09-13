//
//  UserPresenter.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation

final class UserPresenter: PresenterInterface {

    var router: UserRouterPresenterInterface!
    var interactor: UserInteractorPresenterInterface!
    weak var view: UserViewPresenterInterface!

}

extension UserPresenter: UserPresenterRouterInterface {

}

extension UserPresenter: UserPresenterInteractorInterface {

}

extension UserPresenter: UserPresenterViewInterface {

    func start() {

    }

}
