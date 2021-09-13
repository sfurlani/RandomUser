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

extension Collection {

    /// I get tired of typing this so much with just the `compactMap { $0 }` not sure if the generic is set up correctly
    func compactMap<ElementOfResult>() -> [ElementOfResult] {
        return compactMap { $0 as? ElementOfResult }
    }

}

