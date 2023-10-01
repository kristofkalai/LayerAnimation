//
//  CALayer+Animate.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

extension CALayer {
    /// Animate an animatable property.
    /// - Parameters:
    ///   - to: the value to animate.
    ///   - with: the duration of the animation (in seconds). By default `.ulpOfOne`.
    ///   - timingFunction: the desired timing. By default `.linear`.
    ///   - repeatCount: the number of times the animation will repeat. By default `.zero`.
    ///   - autoreverses: whether the animation should reverse itself. By default `false`.
    ///   - completion: this function gets called after the animation is done. By default does nothing.
    /// - Note:
    /// Always test on real device. On simulator it flickers / flashes.
    /// - Returns:
    ///     The `CAAnimation`.
    @discardableResult public func animate<T>(
        to animatable: T,
        with duration: TimeInterval = .ulpOfOne,
        timingFunction: CAMediaTimingFunction = .linear,
        repeatCount: Float = .zero,
        autoreverses: Bool = false,
        completion: @escaping (Bool) -> Void = { _ in }
    ) -> CAAnimation where T: Animatable {
        removeAnimation(forKey: animatable.keyPath)
        model().setValue(currentLayer.value(forKeyPath: animatable.keyPath), forKeyPath: animatable.keyPath)
        let animation = CABasicAnimation(keyPath: animatable.keyPath)
        CATransaction.commit {
            animation.fromValue = animatable.from(layer: self)
            animation.toValue = animatable.targetValue
            animation.duration = duration.clamped(to: .ulpOfOne...)
            animation.timingFunction = timingFunction
            animation.repeatCount = repeatCount
            animation.autoreverses = autoreverses
            animation.isRemovedOnCompletion = false
            animation.fillMode = .forwards
            animation.completion { [weak self] didFinish in
                if didFinish {
                    self?.model().setValue(animatable.targetValue, forKeyPath: animatable.keyPath)
                    self?.removeAnimation(forKey: animatable.keyPath)
                }
                completion(didFinish)
            }
            removeAnimation(forKey: animatable.keyPath)
            addPropertyAnimation(animation)
        }
        return animation
    }

    /// Animate an animatable property.
    /// - Parameters:
    ///   - to: the animator object.
    /// - Note:
    /// Always test on real device. On simulator it flickers / flashes.
    /// - Returns:
    ///     The `CAAnimation`.
    @discardableResult public func animate<T>(to animator: LayerAnimator<T>) -> CAAnimation {
        animate(to: animator.animatable, with: animator.duration, timingFunction: animator.timingFunction, repeatCount: animator.repeatCount, autoreverses: animator.autoreverses, completion: animator.completion)
    }
}
