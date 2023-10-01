//
//  Animatable.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

/// Animatable properties of the layer.
public protocol Animatable {
    /// The keypath of the property.
    var keyPath: String { get }

    /// The desired final value of the animation.
    var targetValue: Any { get }
}

extension Animatable {
    /// Call to finish the animation.
    /// - Parameters:
    ///   - layer: the layer to which the value will be applied.
    /// - Note:
    /// The current presented value will be applied to the model layer, and the animation will be removed.
    public func finished(layer: CALayer) {
        layer.setValue(from(layer: layer), forKey: keyPath)
    }

    /// The initial value of the animation.
    /// - Parameters:
    ///   - layer: the layer from which the value will be obtained.
    /// - Returns:
    ///     The initial value.
    public func from(layer: CALayer) -> Any? {
        layer.currentLayer.value(forKeyPath: keyPath)
    }
}
