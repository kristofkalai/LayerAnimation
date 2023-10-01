//
//  CAEmitterLayer+Animations.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

extension CAEmitterLayer {
    /// Animatable properties of the layer.
    public enum EmitterLayerAnimatable: Animatable {
        case emitterPosition(CGPoint)
        case emitterZPosition(CGFloat)
        case emitterSize(CGSize)

        case spin(Float)
        case velocity(Float)
        case birthRate(Float)
        case lifetime(Float)

        public static func spin(_ spin: CGFloat) -> Self {
            .spin(spin.float)
        }

        public static func velocity(_ velocity: CGFloat) -> Self {
            .velocity(velocity.float)
        }

        public static func birthRate(_ birthRate: CGFloat) -> Self {
            .birthRate(birthRate.float)
        }

        public static func lifetime(_ lifetime: CGFloat) -> Self {
            .lifetime(lifetime.float)
        }

        /// The keypath of the property.
        public var keyPath: String {
            switch self {
            case .emitterPosition: return #keyPath(CAEmitterLayer.emitterPosition)
            case .emitterZPosition: return #keyPath(CAEmitterLayer.emitterZPosition)
            case .emitterSize: return #keyPath(CAEmitterLayer.emitterSize)
            case .spin: return #keyPath(CAEmitterLayer.spin)
            case .velocity: return #keyPath(CAEmitterLayer.velocity)
            case .birthRate: return #keyPath(CAEmitterLayer.birthRate)
            case .lifetime: return #keyPath(CAEmitterLayer.lifetime)
            }
        }

        /// The desired final value of the animation.
        public var targetValue: Any {
            switch self {
            case let .emitterPosition(emitterPosition): return emitterPosition
            case let .emitterZPosition(emitterZPosition): return emitterZPosition
            case let .emitterSize(emitterSize): return emitterSize
            case let .spin(spin): return spin
            case let .velocity(velocity): return velocity
            case let .birthRate(birthRate): return birthRate
            case let .lifetime(lifetime): return lifetime
            }
        }
    }
}

extension CAEmitterLayer {
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
    ///   - emitterPosition: the position of the center of the particle emitter. By default `nil`.
    ///   - emitterZPosition: the center of the particle emitter shape along the z-axis. By default `nil`.
    ///   - emitterSize: the size of the particle emitter shape. By default `nil`.
    ///   - spin: a multiplier applied to the cell-defined particle spin. By default `nil`.
    ///   - velocity: a multiplier applied to the cell-defined particle velocity. By default `nil`.
    ///   - birthRate: a multiplier applied to the cell-defined particle birth rate. By default `nil`.
    ///   - lifetime: a multiplier applied to the cell-defined lifetime range when particles are created. By default `nil`.
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
                            emitterPosition: CGPoint? = nil,
                            emitterZPosition: CGFloat? = nil,
                            emitterSize: CGSize? = nil,
                            spin: Float? = nil,
                            velocity: Float? = nil,
                            birthRate: Float? = nil,
                            lifetime: Float? = nil) {
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
        self.emitterPosition =? emitterPosition
        self.emitterZPosition =? emitterZPosition
        self.emitterSize =? emitterSize
        self.spin =? spin
        self.velocity =? velocity
        self.birthRate =? birthRate
        self.lifetime =? lifetime
    }

    /// Specify the `CAEmitterLayer`.
    /// - Parameters:
    ///   - emitterPosition: the position of the center of the particle emitter.
    /// - Returns:
    ///     The modified `CAEmitterLayer`.
    @discardableResult public func with(emitterPosition: CGPoint) -> Self {
        self.emitterPosition = emitterPosition
        return self
    }

    /// Specify the `CAEmitterLayer`.
    /// - Parameters:
    ///   - emitterZPosition: the center of the particle emitter shape along the z-axis.
    /// - Returns:
    ///     The modified `CAEmitterLayer`.
    @discardableResult public func with(emitterZPosition: CGFloat) -> Self {
        self.emitterZPosition = emitterZPosition
        return self
    }

    /// Specify the `CAEmitterLayer`.
    /// - Parameters:
    ///   - emitterSize: the size of the particle emitter shape.
    /// - Returns:
    ///     The modified `CAEmitterLayer`.
    @discardableResult public func with(emitterSize: CGSize) -> Self {
        self.emitterSize = emitterSize
        return self
    }

    /// Specify the `CAEmitterLayer`.
    /// - Parameters:
    ///   - spin: a multiplier applied to the cell-defined particle spin.
    /// - Returns:
    ///     The modified `CAEmitterLayer`.
    @discardableResult public func with(spin: Float) -> Self {
        self.spin = spin
        return self
    }

    /// Specify the `CAEmitterLayer`.
    /// - Parameters:
    ///   - velocity: a multiplier applied to the cell-defined particle velocity.
    /// - Returns:
    ///     The modified `CAEmitterLayer`.
    @discardableResult public func with(velocity: Float) -> Self {
        self.velocity = velocity
        return self
    }

    /// Specify the `CAEmitterLayer`.
    /// - Parameters:
    ///   - birthRate: a multiplier applied to the cell-defined particle birth rate.
    /// - Returns:
    ///     The modified `CAEmitterLayer`.
    @discardableResult public func with(birthRate: Float) -> Self {
        self.birthRate = birthRate
        return self
    }

    /// Specify the `CAEmitterLayer`.
    /// - Parameters:
    ///   - lifetime: a multiplier applied to the cell-defined lifetime range when particles are created.
    /// - Returns:
    ///     The modified `CAEmitterLayer`.
    @discardableResult public func with(lifetime: Float) -> Self {
        self.lifetime = lifetime
        return self
    }
}
