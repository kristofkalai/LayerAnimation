//
//  CATransaction+Extensions.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

extension CATransaction {
    /// Create a `CATransaction`.
    /// - Parameters:
    ///   - withAnimation: whether animations are enabled. By default `true`.
    ///   - timingFunction: the timing function. If `nil`, then not applied. By default `nil`.
    ///   - duration: the duration. If `nil`, then not applied. By default `nil`.
    ///   - _: the block to run inside the transaction.
    ///   - completion: the completion block which runs after the transaction.
    /// - Note:
    /// The transaction is nested within the thread’s current transaction, if there is one.
    /// - Returns:
    ///     The block's returned value.
    @discardableResult public class func commit<T>(
        withAnimation: Bool = true,
        timingFunction: CAMediaTimingFunction? = nil,
        duration: TimeInterval? = nil,
        _ block: () throws -> T,
        completion: @escaping () -> Void = { }
    ) rethrows -> T {
        /// https://stackoverflow.com/a/47536770/8658561
        /// You must have the line `.setCompletionBlock` before the line `layer.add`.
        begin()
        setAnimationTimingFunction(timingFunction)
        setCompletionBlock(completion)
        setDisableActions(!withAnimation)
        if let duration {
            setAnimationDuration(duration)
        }
        /// Defer will be called just after the return statement.
        defer {
            commit()
        }
        return try block()
    }
}
