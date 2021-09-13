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
}

extension MainRouter: MainRouterPresenterInterface {

}
