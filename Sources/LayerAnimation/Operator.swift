//
//  Operator.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import Foundation

infix operator =?

/// Operator that assigns a new value only if the new value isn't `nil`.
/// - Parameters:
///   - lhs: the value to be set.
///   - rhs: the new value.
/// - Note:
/// Since the inout parameters' `willSet` / `didSet` / `get` / `set` methods always get called after the method, it cannot be avoided.
/// https://stackoverflow.com/a/32975293
public func =?<T>(lhs: inout T, rhs: T?) {
    rhs.map { lhs = $0 }
}

/// Operator that assigns a new value only if the new value isn't `nil`.
/// - Parameters:
///   - lhs: the value to be set.
///   - rhs: the new value.
/// - Note:
/// Since the inout parameters' `willSet` / `didSet` / `get` / `set` methods always get called after the method, it cannot be avoided.
/// https://stackoverflow.com/a/32975293
public func =?<T>(lhs: inout T?, rhs: T?) {
    rhs.map { lhs = $0 }
}
