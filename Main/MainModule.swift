//
//  MainModule.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//
import Foundation
import UIKit
import VIPER

// MARK: - router

protocol MainRouterPresenterInterface: RouterPresenterInterface {

    func setRoot()

}

// MARK: - presenter

protocol MainPresenterRouterInterface: PresenterRouterInterface {

}

protocol MainPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol MainPresenterViewInterface: PresenterViewInterface {
    func start()
}

// MARK: - interactor

protocol MainInteractorPresenterInterface: InteractorPresenterInterface {

}

// MARK: - view

protocol MainViewPresenterInterface: ViewPresenterInterface {

}


// MARK: - name builder

final class MainModule: ModuleInterface {

    typealias View = MainView
    typealias Presenter = MainPresenter
    typealias Router = MainRouter
    typealias Interactor = MainInteractor

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
