//
//  UserRouter.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation
import UIKit
import VIPER

final class UserRouter: RouterInterface {

    weak var presenter: UserPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension UserRouter: UserRouterPresenterInterface {

    func showDetail(user: UserEntity) {
        let detail = UserDetailModule().build(for: user)
        if let nav = viewController?.navigationController {
            nav.pushViewController(detail, animated: true)
        } else {
            viewController?.present(detail, animated: true)
        }
    }

}
