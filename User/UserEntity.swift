//
//  UserEntity.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/13/21.
//

import Foundation
import VIPER

struct UserEntity: Decodable, EntityInterface {

    let name: Name
    let email: String
    let picture: Picture

    struct Name: Decodable {
        let first: String
        let last: String

        var full: String {
            return "\(first) \(last)"
        }
    }

    struct Picture: Decodable {
        let large: URL
        let medium: URL
        let thumbnail: URL
    }

}

extension UserEntity: Hashable, Equatable {

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name.full == rhs.name.full
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name.full)
    }
}
