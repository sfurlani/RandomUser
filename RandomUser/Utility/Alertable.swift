//
//  Alertable.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/13/21.
//

import Foundation
import UIKit
import VIPER

protocol PresenterAlertable {
    func simpleAlert(title: String, message: String)
}


extension PresenterInterface where Self: PresenterAlertable, Self.RouterPresenter: RouterAlertable {

    func simpleAlert(title: String, message: String) {
        router.simpleAlert(title: title, message: message)
    }

}

protocol RouterAlertable {
    func simpleAlert(title: String, message: String)
    var viewController: UIViewController? { get }
}

extension RouterInterface where Self: RouterAlertable {

    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController?.present(alert, animated: true)
    }

}


