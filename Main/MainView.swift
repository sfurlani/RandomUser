//
//  MainView.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation
import UIKit
import VIPER

final class MainView: UINavigationController, ViewInterface {

    var presenter: MainPresenterViewInterface!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.start()
    }

}

extension MainView: MainViewPresenterInterface {

}
