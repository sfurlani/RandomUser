//
//  UserInteractor.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation
import VIPER

final class UserInteractor: InteractorInterface {

    weak var presenter: UserPresenterInteractorInterface!
}

extension UserInteractor: UserInteractorPresenterInterface {

}
