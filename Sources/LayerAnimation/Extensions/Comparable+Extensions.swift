//
//  Comparable+Extensions.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import Foundation

extension Comparable {
    /// Limit the value to a range.
    /// - Parameters:
    ///   - range: the provided range.
    /// - Returns:
    ///     The limited value within the provided `range`.
    public func clamped(to range: ClosedRange<Self>) -> Self {
        max(range.lowerBound, min(self, range.upperBound))
    }

    /// Limit the value to a range.
    /// - Parameters:
    ///   - range: the provided range.
    /// - Returns:
    ///     The limited value within the provided `range`.
    public func clamped(to range: PartialRangeFrom<Self>) -> Self {
        max(range.lowerBound, self)
    }

    /// Limit the value to a range.
    /// - Parameters:
    ///   - range: the provided range.
    /// - Returns:
    ///     The limited value within the provided `range`.
    public func clamped(to range: PartialRangeUpTo<Self>) -> Self {
        min(self, range.upperBound)
    }

    /// Limit the value to a range.
    /// - Parameters:
    ///   - range: the provided range.
    /// - Returns:
    ///     The limited value within the provided `range`.
    public func clamped(to range: PartialRangeThrough<Self>) -> Self {
        min(self, range.upperBound)
    }

    /// Limit the value to a range.
    /// - Parameters:
    ///   - range: the provided range.
    /// - Returns:
    ///     The limited value within the provided `range`.
    public func clamped(to range: Range<Self>) -> Self {
        min(range.lowerBound, range.upperBound)
    }
}

extension Comparable {
    /// Limit the value to a range.
    /// - Parameters:
    ///   - min: lower bound to limit the value to.
    ///   - max: upper bound to limit the value to.
    /// - Returns:
    ///     The limited value within `min` and `max`.
    public func clamped(min: Self, max: Self) -> Self {
        clamped(to: min...max)
    }

    /// Limit the value to a range.
    /// - Parameters:
    ///   - min: lower bound to limit the value to.
    /// - Returns:
    ///     The limited value that is bigger than or equal to `min``.
    public func clamped(min: Self) -> Self {
        clamped(to: min...)
    }

    /// Limit the value to a range.
    /// - Parameters:
    ///   - max: upper bound to limit the value to.
    /// - Returns:
    ///     The limited value that is smaller than or equal to`max`.
    public func clamped(max: Self) -> Self {
        clamped(to: ...max)
    }
}
