//
//  UserModule.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//
import Foundation
import UIKit
import VIPER
import Alamofire

// MARK: - router

protocol UserRouterPresenterInterface: RouterPresenterInterface {

    func showDetail(user: UserEntity)
}

// MARK: - presenter

protocol UserPresenterRouterInterface: PresenterRouterInterface {

}

protocol UserPresenterInteractorInterface: PresenterInteractorInterface {

    func handleLoadUsers(result: Result<[UserEntity], Error>)

}

protocol UserPresenterViewInterface: PresenterViewInterface {

    func start()
    func showDetail(user: UserEntity)
}

// MARK: - interactor

protocol UserInteractorPresenterInterface: InteractorPresenterInterface {

    // Swift 5.5 - async method which returns [User]?
    // async func loadUsers() throws -> [User]
    func loadUsers()

    func cancel()

}

// MARK: - view

protocol UserViewPresenterInterface: ViewPresenterInterface {

    func showLoading()
    func show(users: [UserEntity])
    func show(error: Error)
    func deselectAll()

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
