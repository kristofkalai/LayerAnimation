//
//  CALayer+Extensions.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

extension CALayer {
    /// The presentation layer, or if that is `nil`, then the model layer.
    public var currentLayer: Self {
        presentation() ?? self
    }

    /// Add a `CAPropertyAnimation` to the layer.
    /// - Parameters:
    ///   - _: the animation.
    /// - Note:
    /// The key is the `animation.keyPath`.
    /// - Returns:
    ///     The key with which the animation is added to the layer.
    @discardableResult public func addPropertyAnimation(_ animation: CAPropertyAnimation) -> String? {
        if animation.duration < .ulpOfOne {
            animation.duration = .ulpOfOne
        }
        animation.beginTime = CACurrentMediaTime()
        let key = animation.keyPath
        add(animation, forKey: key)
        return key
    }
}
