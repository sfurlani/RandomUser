//
//  MainPresenter.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation
import VIPER

final class MainPresenter: PresenterInterface {

    var router: MainRouterPresenterInterface!
    var interactor: MainInteractorPresenterInterface!
    weak var view: MainViewPresenterInterface!

}

extension MainPresenter: MainPresenterRouterInterface {

}

extension MainPresenter: MainPresenterInteractorInterface {

}

extension MainPresenter: MainPresenterViewInterface {

    func start() {
        router.setRoot()
    }

}
