//
//  CAMediaTimingFunction+Extensions.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

extension CAMediaTimingFunction {
    /// The default `CAMediaTimingFunction`.
    public class var `default`: Self {
        Self(name: .default)
    }

    /// The ease in (begins slowly) `CAMediaTimingFunction`.
    public class var easeIn: Self {
        Self(name: .easeIn)
    }

    /// The ease out (finishes slowly) `CAMediaTimingFunction`.
    public class var easeOut: Self {
        Self(name: .easeOut)
    }

    /// The linear `CAMediaTimingFunction`.
    public class var linear: Self {
        Self(name: .linear)
    }

    /// The ease in ease out (begins and finishes slowly) `CAMediaTimingFunction`.
    public class var easeInEaseOut: Self {
        Self(name: .easeInEaseOut)
    }
}
