//
//  UserDetailRouter.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/13/21.
//

import Foundation
import UIKit
import VIPER
import MessageUI

final class UserDetailRouter: NSObject, RouterInterface {

    enum EmailResult {
        case unableToSend
        case error(Error)
        case ok(MFMailComposeResult)
    }

    weak var presenter: UserDetailPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension UserDetailRouter: UserDetailRouterPresenterInterface {

    func openEmail(email: String) {

        guard MFMailComposeViewController.canSendMail() else {
            presenter.finishedEmail(result: .unableToSend)
            return
        }

        let mfmail = MFMailComposeViewController()
        mfmail.mailComposeDelegate = self
        mfmail.setToRecipients([email])
        viewController?.present(mfmail, animated: true)
    }
}

extension UserDetailRouter: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let error = error {
            presenter.finishedEmail(result: .error(error))
        } else {
            presenter.finishedEmail(result: .ok(result))
        }
    }
}
