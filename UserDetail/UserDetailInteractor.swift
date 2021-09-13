//
//  UserDetailInteractor.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/13/21.
//

import Foundation
import UIKit
import VIPER
import Alamofire
import AlamofireImage

final class UserDetailInteractor: InteractorInterface {

    enum ImageState {
        case loading
        case image(UIImage)
        case error(Error)
    }

    weak var presenter: UserDetailPresenterInteractorInterface!

    let user: UserEntity

    init(for user: UserEntity) {
        self.user = user
    }
}

extension UserDetailInteractor: UserDetailInteractorPresenterInterface {
    func fetchImage() {
        let completion = presenter?.fetched(state:)

        completion?(.loading)

        let request = AF.request(user.picture.large)
        request.responseImage { response in
            switch response.result {
            case .success(let image):
                completion?(.image(image))
            case .failure(let error):
                completion?(.error(error))
            }
        }
    }
}
