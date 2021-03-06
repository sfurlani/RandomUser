//
//  UserDetailModule.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/13/21.
//
import Foundation
import UIKit
import VIPER

// MARK: - router

protocol UserDetailRouterPresenterInterface: RouterPresenterInterface, RouterAlertable {
    func openEmail(email: String)
}

// MARK: - presenter

protocol UserDetailPresenterRouterInterface: PresenterRouterInterface {
    func finishedEmail(result: UserDetailRouter.EmailResult)
}

protocol UserDetailPresenterInteractorInterface: PresenterInteractorInterface {
    func fetched(state: UserDetailInteractor.ImageState)
}

protocol UserDetailPresenterViewInterface: PresenterViewInterface, PresenterAlertable {
    func start()
    func openEmail()
}

// MARK: - interactor

protocol UserDetailInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchImage()
    var user: UserEntity { get }
}

// MARK: - view

protocol UserDetailViewPresenterInterface: ViewPresenterInterface {
    func show(state: UserDetailInteractor.ImageState)
    func show(user: UserEntity)
    func show(result: UserDetailRouter.EmailResult)
}


// MARK: - name builder

final class UserDetailModule: ModuleInterface {

    typealias View = UserDetailView
    typealias Presenter = UserDetailPresenter
    typealias Router = UserDetailRouter
    typealias Interactor = UserDetailInteractor

    func build(for user: UserEntity) -> UIViewController {
        let view = View.instantiate(from: "Main")
        let interactor = Interactor(for: user)
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
