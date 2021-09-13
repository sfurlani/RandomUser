//
//  UIView+Tools.swift
//  RandomUser
//
//  Created by Stephen Furlani on 9/12/21.
//

import Foundation
import UIKit

extension UIView {

    /**
     Sets [top, leading, trailing, bottom] Anchors of this view to the other view (must be in the same view Heirarchy)
     (Updated for iOS 9.0 - replaces old NSLayoutConstraint code)
     */
    func anchorTo(other: UIView, edgeInsets: NSDirectionalEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [topAnchor.constraint(equalTo: other.topAnchor, constant: edgeInsets.top),
             leadingAnchor.constraint(equalTo: other.leadingAnchor, constant: edgeInsets.leading),
             other.trailingAnchor.constraint(equalTo: trailingAnchor, constant: edgeInsets.trailing),
             other.bottomAnchor.constraint(equalTo: bottomAnchor, constant: edgeInsets.bottom)])
    }

    /**
     Sets [top, leading, trailing, bottom] Anchors of this view to the superView
     (Updated for iOS 9.0 - replaces old NSLayoutConstraint code)
     */
    func anchorToSuperview(edgeInsets: NSDirectionalEdgeInsets = .zero) {
        assert(superview != nil)
        anchorTo(other: superview!, edgeInsets: edgeInsets)
    }

    /**
     Sets [centerX, centerY] Anchors of this view to the other view (must be in the same view Heirarchy)
     (Updated for iOS 9.0 - replaces old NSLayoutConstraint code)
     */
    func centerTo(other: UIView, offset: CGPoint = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [centerXAnchor.constraint(equalTo: other.centerXAnchor, constant: offset.x),
             centerYAnchor.constraint(equalTo: other.centerYAnchor, constant: offset.y)])
    }

    /**
     Sets [centerX, centerY] Anchors of this view to the superView
     (Updated for iOS 9.0 - replaces old NSLayoutConstraint code)
     */
    func centerToSuperview(offset: CGPoint = .zero) {
        assert(superview != nil)
        centerTo(other: superview!, offset: offset)
    }


}
