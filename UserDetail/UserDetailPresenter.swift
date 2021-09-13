//
//  UserDetailPresenter.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/13/21.
//

import Foundation
import UIKit
import VIPER

final class UserDetailPresenter: PresenterInterface {

    var router: UserDetailRouterPresenterInterface!
    var interactor: UserDetailInteractorPresenterInterface!
    weak var view: UserDetailViewPresenterInterface!

}

extension UserDetailPresenter: UserDetailPresenterRouterInterface {

}

extension UserDetailPresenter: UserDetailPresenterInteractorInterface {
    func fetched(state: UserDetailInteractor.ImageState) {
        view.show(state: state)
    }

}

extension UserDetailPresenter: UserDetailPresenterViewInterface {
    func start() {
        view.show(user: interactor.user)
        interactor.fetchImage()
    }

    func openEmail() {
        // TODO
    }
}
