//
//  UserModule.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//
import Foundation
import UIKit
import VIPER

// MARK: - router

protocol UserRouterPresenterInterface: RouterPresenterInterface {

}

// MARK: - presenter

protocol UserPresenterRouterInterface: PresenterRouterInterface {

}

protocol UserPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol UserPresenterViewInterface: PresenterViewInterface {
    func start()

    func showDetail(user: Any)
}

// MARK: - interactor

protocol UserInteractorPresenterInterface: InteractorPresenterInterface {

}

// MARK: - view

protocol UserViewPresenterInterface: ViewPresenterInterface {

    func showLoading()
    func show(users: [Any])

}


// MARK: - name builder

final class UserModule: ModuleInterface {

    typealias View = UserView
    typealias Presenter = UserPresenter
    typealias Router = UserRouter
    typealias Interactor = UserInteractor

    func build() -> UIViewController {
        let view = View()
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
