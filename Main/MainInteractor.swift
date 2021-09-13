//
//  MainInteractor.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation
import VIPER

final class MainInteractor: InteractorInterface {

    weak var presenter: MainPresenterInteractorInterface!
}

extension MainInteractor: MainInteractorPresenterInterface {

}
