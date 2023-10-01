//
//  CAReplicatorLayer+Animations.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

extension CAReplicatorLayer {
    public enum ReplicatorLayerAnimatable: Animatable {
        case instanceDelay(TimeInterval)
        case instanceTransform(CATransform3D)

        case instanceColor(CGColor?)
        case instanceRedOffset(Float)
        case instanceGreenOffset(Float)
        case instanceBlueOffset(Float)
        case instanceAlphaOffset(Float)

        public static func instanceColor(_ instanceColor: UIColor?) -> Self {
            .instanceColor(instanceColor?.cgColor)
        }

        public static func instanceRedOffset(_ instanceRedOffset: CGFloat) -> Self {
            .instanceRedOffset(instanceRedOffset.float)
        }

        public static func instanceGreenOffset(_ instanceGreenOffset: CGFloat) -> Self {
            .instanceGreenOffset(instanceGreenOffset.float)
        }

        public static func instanceBlueOffset(_ instanceBlueOffset: CGFloat) -> Self {
            .instanceBlueOffset(instanceBlueOffset.float)
        }

        public static func instanceAlphaOffset(_ instanceAlphaOffset: CGFloat) -> Self {
            .instanceAlphaOffset(instanceAlphaOffset.float)
        }

        /// The keypath of the property.
        public var keyPath: String {
            switch self {
            case .instanceDelay: return #keyPath(CAReplicatorLayer.instanceDelay)
            case .instanceTransform: return #keyPath(CAReplicatorLayer.instanceTransform)
            case .instanceColor: return #keyPath(CAReplicatorLayer.instanceColor)
            case .instanceRedOffset: return #keyPath(CAReplicatorLayer.instanceRedOffset)
            case .instanceGreenOffset: return #keyPath(CAReplicatorLayer.instanceGreenOffset)
            case .instanceBlueOffset: return #keyPath(CAReplicatorLayer.instanceBlueOffset)
            case .instanceAlphaOffset: return #keyPath(CAReplicatorLayer.instanceAlphaOffset)
            }
        }

        /// The desired final value of the animation.
        public var targetValue: Any {
            switch self {
            case let .instanceDelay(instanceDelay): return instanceDelay
            case let .instanceTransform(instanceTransform): return instanceTransform
            case let .instanceColor(instanceColor): return instanceColor as Any
            case let .instanceRedOffset(instanceRedOffset): return instanceRedOffset.float
            case let .instanceGreenOffset(instanceGreenOffset): return instanceGreenOffset.float
            case let .instanceBlueOffset(instanceBlueOffset): return instanceBlueOffset.float
            case let .instanceAlphaOffset(instanceAlphaOffset): return instanceAlphaOffset.float
            }
        }
    }
}

extension CAReplicatorLayer {
    /// Make a `CAReplicatorLayer`.
    /// - Parameters:
    ///   - contents: the contents of the layer. By default `nil`.
    ///   - contentsRect: the rectangle of the contents. By default `nil`.
    ///   - contentsCenter: define how does the contents scaled if the layer resized. By default `nil`.
    ///   - opacity: the opacity of the layer. By default `nil`.
    ///   - isHidden: whether the layer is hidden. By default `nil`.
    ///   - masksToBounds: whether the sublayers are clipped to the layer's bounds. By default `nil`.
    ///   - isDoubleSided: whether the content rendered on the background too. By default `nil`.
    ///   - cornerRadius: the radius of the corners of the layer. By default `nil`.
    ///   - borderWidth: the width of the border of the layer. By default `nil`.
    ///   - borderColor: the color of the border of the layer. By default `nil`.
    ///   - backgroundColor: the color of the background of the layer. By default `nil`.
    ///   - shadowOpacity: the opacity of the shadow of the layer. By default `nil`.
    ///   - shadowRadius: the radius of the shadow of the layer. By default `nil`.
    ///   - shadowOffset: the offset of the shadow of the layer. By default `nil`.
    ///   - shadowColor: the color of the shadow of the layer. By default `nil`.
    ///   - shadowPath: the path of the shadow of the layer. By default `nil`.
    ///   - filters: the filters that are applied to the layer and its sublayers. By default `nil`.
    ///   - compositingFilter: the filter to composite the filter and the content behind that. By default `nil`.
    ///   - backgroundFilters: the filters that are applied to the content behind the layer. By default `nil`.
    ///   - shouldRasterize: whether the layer should be rasterized. By default `nil`.
    ///   - rasterizationScale: the scale at which to rasterize content, relative to the coordinate space of the layer. By default `nil`.
    ///   - bounds: the bounds of the layer. By default `nil`.
    ///   - position: the position of the layer in the superlayer's coordinate space. By default `nil`.
    ///   - zPosition: the position of the layer along the z-axis. By default `nil`.
    ///   - anchorPointZ: the anchor point of the layer along the z-axis. By default `nil`.
    ///   - anchorPoint: the anchor point of the layer. By default `nil`.
    ///   - transform: the transform of the layer. By default `nil`.
    ///   - sublayerTransform: the transform of the sublayers. By default `nil`.
    ///   - instanceDelay: the delay of the instances. By default `nil`.
    ///   - instanceTransform: the transform of the instances. By default `nil`.
    ///   - instanceColor: the color of the instances. By default `nil`.
    ///   - instanceRedOffset: the red offset of the instances. By default `nil`.
    ///   - instanceGreenOffset: the green offset of the instances. By default `nil`.
    ///   - instanceBlueOffset: the blue offset of the instances. By default `nil`.
    ///   - instanceAlphaOffset: the alpha offset of the instances. By default `nil`.
    /// - Note:
    /// Just those porperties will be set that are not `nil`.
    public convenience init(contents: Any? = nil,
                            contentsRect: CGRect? = nil,
                            contentsCenter: CGRect? = nil,
                            opacity: Float? = nil,
                            isHidden: Bool? = nil,
                            masksToBounds: Bool? = nil,
                            isDoubleSided: Bool? = nil,
                            cornerRadius: CGFloat? = nil,
                            borderWidth: CGFloat? = nil,
                            borderColor: CGColor? = nil,
                            backgroundColor: CGColor? = nil,
                            shadowOpacity: Float? = nil,
                            shadowRadius: CGFloat? = nil,
                            shadowOffset: CGSize? = nil,
                            shadowColor: CGColor? = nil,
                            shadowPath: CGPath? = nil,
                            filters: [Any]? = nil,
                            compositingFilter: Any? = nil,
                            backgroundFilters: [Any]? = nil,
                            shouldRasterize: Bool? = nil,
                            rasterizationScale: CGFloat? = nil,
                            bounds: CGRect? = nil,
                            position: CGPoint? = nil,
                            zPosition: CGFloat? = nil,
                            anchorPointZ: CGFloat? = nil,
                            anchorPoint: CGPoint? = nil,
                            transform: CATransform3D? = nil,
                            sublayerTransform: CATransform3D? = nil,
                            instanceDelay: CFTimeInterval? = nil,
                            instanceTransform: CATransform3D? = nil,
                            instanceColor: CGColor? = nil,
                            instanceRedOffset: Float? = nil,
                            instanceGreenOffset: Float? = nil,
                            instanceBlueOffset: Float? = nil,
                            instanceAlphaOffset: Float? = nil) {
        self.init(contents: contents,
                  contentsRect: contentsRect,
                  contentsCenter: contentsCenter,
                  opacity: opacity,
                  isHidden: isHidden,
                  masksToBounds: masksToBounds,
                  isDoubleSided: isDoubleSided,
                  cornerRadius: cornerRadius,
                  borderWidth: borderWidth,
                  borderColor: borderColor,
                  backgroundColor: backgroundColor,
                  shadowOpacity: shadowOpacity,
                  shadowRadius: shadowRadius,
                  shadowOffset: shadowOffset,
                  shadowColor: shadowColor,
                  shadowPath: shadowPath,
                  filters: filters,
                  compositingFilter: compositingFilter,
                  backgroundFilters: backgroundFilters,
                  shouldRasterize: shouldRasterize,
                  rasterizationScale: rasterizationScale,
                  bounds: bounds,
                  position: position,
                  zPosition: zPosition,
                  anchorPointZ: anchorPointZ,
                  anchorPoint: anchorPoint,
                  transform: transform,
                  sublayerTransform: sublayerTransform)
        self.instanceDelay =? instanceDelay
        self.instanceTransform =? instanceTransform
        self.instanceColor =? instanceColor
        self.instanceRedOffset =? instanceRedOffset
        self.instanceGreenOffset =? instanceGreenOffset
        self.instanceBlueOffset =? instanceBlueOffset
        self.instanceAlphaOffset =? instanceAlphaOffset
    }

    /// Specify the `CAReplicatorLayer`.
    /// - Parameters:
    ///   - instanceDelay: the delay of the instances.
    /// - Returns:
    ///     The modified `CAReplicatorLayer`.
    @discardableResult public func with(instanceDelay: CFTimeInterval) -> Self {
        self.instanceDelay = instanceDelay
        return self
    }

    /// Specify the `CAReplicatorLayer`.
    /// - Parameters:
    ///   - instanceTransform: the transform of the instances.
    /// - Returns:
    ///     The modified `CAReplicatorLayer`.
    @discardableResult public func with(instanceTransform: CATransform3D) -> Self {
        self.instanceTransform = instanceTransform
        return self
    }

    /// Specify the `CAReplicatorLayer`.
    /// - Parameters:
    ///   - instanceColor: the color of the instances.
    /// - Returns:
    ///     The modified `CAReplicatorLayer`.
    @discardableResult public func with(instanceColor: CGColor) -> Self {
        self.instanceColor = instanceColor
        return self
    }

    /// Specify the `CAReplicatorLayer`.
    /// - Parameters:
    ///   - instanceColor: the color of the instances.
    /// - Returns:
    ///     The modified `CAReplicatorLayer`.
    @discardableResult public func with(instanceColor: UIColor) -> Self {
        with(instanceColor: instanceColor.cgColor)
    }

    /// Specify the `CAReplicatorLayer`.
    /// - Parameters:
    ///   - instanceRedOffset: the red offset of the instances.
    /// - Returns:
    ///     The modified `CAReplicatorLayer`.
    @discardableResult public func with(instanceRedOffset: Float) -> Self {
        self.instanceRedOffset = instanceRedOffset
        return self
    }

    /// Specify the `CAReplicatorLayer`.
    /// - Parameters:
    ///   - instanceGreenOffset: the green offset of the instances.
    /// - Returns:
    ///     The modified `CAReplicatorLayer`.
    @discardableResult public func with(instanceGreenOffset: Float) -> Self {
        self.instanceGreenOffset = instanceGreenOffset
        return self
    }

    /// Specify the `CAReplicatorLayer`.
    /// - Parameters:
    ///   - instanceBlueOffset: the blue offset of the instances.
    /// - Returns:
    ///     The modified `CAReplicatorLayer`.
    @discardableResult public func with(instanceBlueOffset: Float) -> Self {
        self.instanceBlueOffset = instanceBlueOffset
        return self
    }

    /// Specify the `CAReplicatorLayer`.
    /// - Parameters:
    ///   - instanceAlphaOffset: the alpha offset of the instances.
    /// - Returns:
    ///     The modified `CAReplicatorLayer`.
    @discardableResult public func with(instanceAlphaOffset: Float) -> Self {
        self.instanceAlphaOffset = instanceAlphaOffset
        return self
    }
}
