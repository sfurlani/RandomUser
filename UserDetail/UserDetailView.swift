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
        }
    }
    @IBOutlet weak var profileIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "User"

        self.presenter.start()
    }

    @IBAction func didTapEmail(_ sender: Any) {

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
}
