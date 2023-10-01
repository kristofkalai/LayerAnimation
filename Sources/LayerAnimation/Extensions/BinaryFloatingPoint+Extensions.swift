//
//  BinaryFloatingPoint+Extensions.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import Foundation

extension BinaryFloatingPoint {
    /// Convert the `BinaryFloatingPoint` to a `Float`.
    public var float: Float {
        Float(self)
    }
}
