//
//  UserView.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation
import UIKit

final class UserView: UIViewController, ViewInterface {

    var presenter: UserPresenterViewInterface!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.start()
    }

}

extension UserView: UserViewPresenterInterface {

}
