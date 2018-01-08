//
//  Utils.swift
//  coordinatorDemo
//
//  Created by kkedziora on 08.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardInstantiable: class {
    static var storyboardIdentifier: String { get }
    static var viewControllerIdentifier: String { get }

    static func instantiateFromStoryboard() -> Self
}

extension StoryboardInstantiable where Self: UIViewController {
    static var viewControllerIdentifier: String {
        // Get the name of current class
        let classString = NSStringFromClass(self)
        let components = classString.components(separatedBy: ".")
        assert(components.count > 0, "Failed extract class name from \(classString)")
        return components.last!
    }

    static func instantiateFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: Bundle(for: self))
        return instantiateFromStoryboard(storyboard, type: self)
    }

    static func instantiateFromStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, type: T.Type) -> T {
        return storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! T
    }
}

internal extension UIView {

    /// Adds constraints to this `UIView` instances `superview` object to make sure this always has the same size as the superview.
    /// Please note that this has no effect if its `superview` is `nil` – add this `UIView` instance as a subview before calling this.
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
}
