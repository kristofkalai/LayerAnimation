//
//  LayerAnimator.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

/// The animator object that wraps all animation properties.
public final class LayerAnimator<T: Animatable> {
    /// The animatable property.
    public private(set) var animatable: T

    /// The duration of the animation.
    public private(set) var duration: TimeInterval = .ulpOfOne

    /// The timing function of the animation.
    public private(set) var timingFunction: CAMediaTimingFunction = .linear

    /// The repeat count of the animation.
    public private(set) var repeatCount: Float = .zero

    /// Whether the animation should reverse itself.
    public private(set) var autoreverses = false

    /// The completion handler of the animation.
    public private(set) var completion: (Bool) -> Void = { _ in }

    /// Create a `LayerAnimator`.
    /// - Parameters:
    ///   - animatable: the animatable property.
    public init(animatable: T) {
        self.animatable = animatable
    }
}

extension LayerAnimator {
    /// Specify the `LayerAnimator`.
    /// - Parameters:
    ///   - animatable: the given `Animatable`.
    /// - Returns:
    ///     The modified `LayerAnimator`.
    @discardableResult public func with(animatable: T) -> Self {
        self.animatable = animatable
        return self
    }

    /// Specify the `LayerAnimator`.
    /// - Parameters:
    ///   - duration: the given duration.
    /// - Returns:
    ///     The modified `LayerAnimator`.
    @discardableResult public func with(duration: TimeInterval) -> Self {
        self.duration = duration
        return self
    }

    /// Specify the `LayerAnimator`.
    /// - Parameters:
    ///   - timingFunction: the given timing function.
    /// - Returns:
    ///     The modified `LayerAnimator`.
    @discardableResult public func with(timingFunction: CAMediaTimingFunction) -> Self {
        self.timingFunction = timingFunction
        return self
    }

    /// Specify the `LayerAnimator`.
    /// - Parameters:
    ///   - timingFunctionName: the given timing function name.
    /// - Returns:
    ///     The modified `LayerAnimator`.
    @discardableResult public func with(timingFunctionName: CAMediaTimingFunctionName) -> Self {
        with(timingFunction: .init(name: timingFunctionName))
    }

    /// Specify the `LayerAnimator`.
    /// - Parameters:
    ///   - repeatCount: the given repeat count.
    /// - Returns:
    ///     The modified `LayerAnimator`.
    @discardableResult public func with(repeatCount: Float) -> Self {
        self.repeatCount = repeatCount
        return self
    }

    /// Specify the `LayerAnimator`.
    /// - Parameters:
    ///   - autoreverses: whether the animation should reverse itself.
    /// - Returns:
    ///     The modified `LayerAnimator`.
    @discardableResult public func with(autoreverses: Bool) -> Self {
        self.autoreverses = autoreverses
        return self
    }

    /// Specify the `LayerAnimator`.
    /// - Parameters:
    ///   - completion: the given completion handler.
    /// - Returns:
    ///     The modified `LayerAnimator`.
    @discardableResult public func with(completion: @escaping (Bool) -> Void) -> Self {
        self.completion = completion
        return self
    }
}
