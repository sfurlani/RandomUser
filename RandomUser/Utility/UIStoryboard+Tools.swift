//
//  UIStoryboard+Tools.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/13/21.
//

import Foundation
import UIKit

protocol UIStoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension UIStoryboardIdentifiable where Self: UIViewController {

    static func instantiate(from name: String, bundle: Bundle? = nil) -> Self {
        return UIStoryboard(name: name, bundle: bundle).instantiateViewController()
    }

}

extension UIStoryboard {

    func instantiateViewController<T>() -> T where T: UIViewController, T: UIStoryboardIdentifiable {
        return instantiateViewController(identifier: T.storyboardIdentifier)
    }

}
