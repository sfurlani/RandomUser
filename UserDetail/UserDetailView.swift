//
//  UserDetailView.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/13/21.
//

import Foundation
import UIKit
import VIPER

final class UserDetailView: UIViewController, ViewInterface, UIStoryboardIdentifiable {
    static let storyboardIdentifier: String = "user_detail_view"

    var presenter: UserDetailPresenterViewInterface!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var profilePicture: UIImageView! {
        didSet {
            profilePicture.layer.masksToBounds = true
            profilePicture.layer.cornerRadius = 16
            profilePicture.layer.cornerCurve = .continuous
            profilePicture.layer.borderWidth = 1.0
            profilePicture.layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
    @IBOutlet weak var profileIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "User"

        self.presenter.start()
    }

    @IBAction func didTapEmail(_ sender: Any) {
        presenter.openEmail()
    }

}

extension UserDetailView: UserDetailViewPresenterInterface {
    func show(state: UserDetailInteractor.ImageState) {
        switch state {
        case .loading:
            profilePicture.backgroundColor = .systemGray4
            profilePicture.image = nil
            profileIndicator.startAnimating()
        case .error(let error):
            // TODO
            print(error)
            profilePicture.backgroundColor = .systemRed
            profilePicture.image = nil
            profileIndicator.stopAnimating()

        case .image(let image):
            profilePicture.backgroundColor = .clear
            profilePicture.image = image
            profileIndicator.stopAnimating()
        }
    }

    func show(user: UserEntity) {
        nameLabel.text = user.name.full

        let fmt = NSLocalizedString("email: %@", comment: "Email Button Prompt")
        let email = String(format: fmt, user.email)
        emailButton.setTitle(email, for: .normal)
    }

    func show(result: UserDetailRouter.EmailResult) {
        switch result {
        case .ok:
            // assuming the user is in control of the result (sent, cancelled, or saved)
            break
        case .unableToSend:
            presenter.simpleAlert(title: "Unable to Email", message: "Your device is not configured to send emails at this time.")
        case .error(let error):
            // TODO:
            print(error)
        }
    }
}
