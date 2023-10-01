//
//  CAAnimation+Extensions.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

extension CAAnimation {
    final private class AnimationDelegate: NSObject, CAAnimationDelegate {
        fileprivate var didStartCallback: () -> Void = { }
        fileprivate var didStopCallback: (Bool) -> Void = { _ in }

        fileprivate func animationDidStart(_ anim: CAAnimation) {
            didStartCallback()
        }

        fileprivate func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
            didStopCallback(flag)
        }
    }

    /// Call to get a callback if the animation did start.
    /// - Parameters:
    ///   - callback: this function will be called if the animation did start.
    /// - Note:
    /// The `CAAnimation` holds a strong reference to its `delegate`. You don't need to store it.
    /// - Returns:
    ///     The delegate.
    @discardableResult public func start(callback: @escaping () -> Void) -> CAAnimationDelegate {
        if let delegate = delegate as? AnimationDelegate {
            delegate.didStartCallback = callback
            return delegate
        } else {
            let delegate = AnimationDelegate()
            delegate.didStartCallback = callback
            self.delegate = delegate
            return delegate
        }
    }

    /// Call to get a callback if the animation did finish.
    /// - Parameters:
    ///   - callback: this function will be called if the animation did finish.
    /// - Note:
    /// The `CAAnimation` holds a strong reference to its `delegate`. You don't need to store it.
    /// - Returns:
    ///     The delegate.
    @discardableResult public func completion(callback: @escaping (Bool) -> Void) -> CAAnimationDelegate {
        if let delegate = delegate as? AnimationDelegate {
            delegate.didStopCallback = callback
            return delegate
        } else {
            let delegate = AnimationDelegate()
            delegate.didStopCallback = callback
            self.delegate = delegate
            return delegate
        }
    }

    /// Call to get a callback if the animation did finish.
    /// - Parameters:
    ///   - callback: this function will be called if the animation did finish.
    /// - Note:
    /// The `CAAnimation` holds a strong reference to its `delegate`. You don't need to store it.
    /// - Returns:
    ///     The delegate.
    @discardableResult public func completion(callback: @escaping () -> Void) -> CAAnimationDelegate {
        completion(callback: { _ in callback() })
    }
}
