//
//  Optional+Collection.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation

extension Optional where Wrapped: Collection {

    var isEmpty: Bool {
        switch self {
        case .some(let collection):
            return collection.isEmpty
        case .none:
            return true
        }
    }

}

