//
//  MainRouter.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation
import UIKit
import VIPER

final class MainRouter: RouterInterface {

    weak var presenter: MainPresenterRouterInterface!

    weak var viewController: UIViewController?

    fileprivate weak var navigator: UINavigationController? {
        if let nav = viewController as? UINavigationController {
            return nav
        }
        return viewController?.navigationController
    }
}

extension MainRouter: MainRouterPresenterInterface {

    func setRoot() {

        let root = UserModule().build()

        navigator?.viewControllers = [root]
    }

}
