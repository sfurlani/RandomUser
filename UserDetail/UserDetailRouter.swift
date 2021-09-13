//
//  UserDetailRouter.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/13/21.
//

import Foundation
import UIKit
import VIPER

final class UserDetailRouter: RouterInterface {

    weak var presenter: UserDetailPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension UserDetailRouter: UserDetailRouterPresenterInterface {

}
