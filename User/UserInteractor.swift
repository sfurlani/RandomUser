//
//  UserInteractor.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation
import VIPER
import Alamofire

final class UserInteractor: InteractorInterface {

    private var cache: RandomUserResponse?
    private var inflight: Request?

    indirect enum Error: Swift.Error {
        case unknown
    }

    weak var presenter: UserPresenterInteractorInterface!
}

extension UserInteractor: UserInteractorPresenterInterface {

    func loadUsers() {
        guard inflight == nil else {
            return
        }

        let completion = presenter?.handleLoadUsers(result: )

        // TODO Cache invalidation?
        // TODO Check Pagination?
        if let cache = cache {
            DispatchQueue.global().async {
                completion?(.success(cache.results.compactMap()))
            }
            return
        }

        let request = AF.request("https://randomuser.me/api",
                                 method: .get,
                                 parameters: ["results": 40])
        request.responseDecodable(of: RandomUserResponse.self) { response in

            switch response.result {
            case .success(let value):
                self.cache = value
                completion?(.success(value.results.compactMap()))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }

    func cancel() {
        guard let inflight = inflight else {
            return
        }

        inflight.cancel()
        self.inflight = nil
    }
}

private struct RandomUserResponse: Decodable {

    let results: [UserEntity?]

    // let info: Info

}
