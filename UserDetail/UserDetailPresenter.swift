//
//  UserDetailPresenter.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/13/21.
//

import Foundation
import UIKit
import VIPER

final class UserDetailPresenter: PresenterInterface, PresenterAlertable {

    /// Not sure why this wasn't pulling from the protocols and extensions I set up ut it's like 4am and im gonna do this later?
    func simpleAlert(title: String, message: String) {
        router.simpleAlert(title: title, message: message)
    }


    var router: UserDetailRouterPresenterInterface!
    var interactor: UserDetailInteractorPresenterInterface!
    weak var view: UserDetailViewPresenterInterface!

}

extension UserDetailPresenter: UserDetailPresenterRouterInterface {

    func finishedEmail(result: UserDetailRouter.EmailResult) {
        view.show(result: result)
    }
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
        router.openEmail(email: interactor.user.email)
    }
}
