//
//  CAGradientLayer+Animations.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

extension CAGradientLayer {
    public enum GradientLayerAnimatable: Animatable {
        case colors([CGColor]?)
        case locations([NSNumber]?)
        case endPoint(CGPoint)
        case startPoint(CGPoint)

        public static func colors(_ colors: [UIColor]?) -> Self {
            .colors(colors?.map { $0.cgColor })
        }

        public static func locations(_ locations: [CGFloat]?) -> Self {
            .locations(locations?.map { NSNumber(value: $0.float) })
        }

        /// The keypath of the property.
        public var keyPath: String {
            switch self {
            case .colors: return #keyPath(CAGradientLayer.colors)
            case .locations: return #keyPath(CAGradientLayer.locations)
            case .endPoint: return #keyPath(CAGradientLayer.endPoint)
            case .startPoint: return #keyPath(CAGradientLayer.startPoint)
            }
        }

        /// The desired final value of the animation.
        public var targetValue: Any {
            switch self {
            case let .colors(colors): return colors as Any
            case let .locations(locations): return locations as Any
            case let .endPoint(endPoint): return endPoint
            case let .startPoint(startPoint): return startPoint
            }
        }
    }
}

extension CAGradientLayer {
    /// Make a `CAGradientLayer`.
    /// - Parameters:
    ///   - colors: the color of each gradient stop. By default `nil`.
    ///   - locations: the location of each gradient stop. By default `nil`.
    ///   - startPoint: the start point of the gradient. By default `CGPoint(x: 0.5, y: .zero)`.
    ///   - endPoint: the end point of the gradient. By default `CGPoint(x: 0.5, y: 1)`.
    ///   - type: style of gradient drawn by the layer. By default `.axial`.
    public convenience init(colors: [UIColor]? = nil, locations: [CGFloat]? = nil, startPoint: CGPoint = CGPoint(x: 0.5, y: .zero), endPoint: CGPoint = CGPoint(x: 0.5, y: 1), type: CAGradientLayerType = .axial) {
        self.init()
        self.colors = colors?.map(\.cgColor)
        self.locations = locations?.map { NSNumber(value: Double($0)) }
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.type = type
    }
}

extension CAGradientLayer {
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
    ///   - colors: the colors of the layer. By default `nil`.
    ///   - locations: the locations of the layer. By default `nil`.
    ///   - startPoint: the starting point of the layer. By default `nil`.
    ///   - endPoint: the ending point of the layer. By default `nil`.
    ///   - type: the type of the gradient of the layer. By default `nil`.
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
                            colors: [CGColor]? = nil,
                            locations: [NSNumber]? = nil,
                            startPoint: CGPoint? = nil,
                            endPoint: CGPoint? = nil,
                            type: CAGradientLayerType? = nil) {
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
        self.colors =? colors
        self.locations =? locations
        self.startPoint =? startPoint
        self.endPoint =? endPoint
        self.type =? type
    }

    /// Specify the `CAGradientLayer`.
    /// - Parameters:
    ///   - colors: the colors of the layer.
    /// - Returns:
    ///     The modified `CAGradientLayer`.
    @discardableResult public func with(colors: [CGColor]?) -> Self {
        self.colors = colors
        return self
    }

    /// Specify the `CAGradientLayer`.
    /// - Parameters:
    ///   - colors: the colors of the layer.
    /// - Returns:
    ///     The modified `CAGradientLayer`.
    @discardableResult public func with(colors: [UIColor]?) -> Self {
        with(colors: colors?.map(\.cgColor))
    }

    /// Specify the `CAGradientLayer`.
    /// - Parameters:
    ///   - locations: the locations of the layer.
    /// - Returns:
    ///     The modified `CAGradientLayer`.
    @discardableResult public func with(locations: [NSNumber]?) -> Self {
        self.locations = locations
        return self
    }

    /// Specify the `CAGradientLayer`.
    /// - Parameters:
    ///   - locations: the locations of the layer.
    /// - Returns:
    ///     The modified `CAGradientLayer`.
    @discardableResult public func with(locations: [CGFloat]?) -> Self {
        with(locations: locations?.map { NSNumber(value: Double($0)) })
    }

    /// Specify the `CAGradientLayer`.
    /// - Parameters:
    ///   - startPoint: the starting point of the layer.
    /// - Returns:
    ///     The modified `CAGradientLayer`.
    @discardableResult public func with(startPoint: CGPoint) -> Self {
        self.startPoint = startPoint
        return self
    }

    /// Specify the `CAGradientLayer`.
    /// - Parameters:
    ///   - endPoint: the ending point of the layer.
    /// - Returns:
    ///     The modified `CAGradientLayer`.
    @discardableResult public func with(endPoint: CGPoint) -> Self {
        self.endPoint = endPoint
        return self
    }

    /// Specify the `CAGradientLayer`.
    /// - Parameters:
    ///   - type: the type of the gradient of the layer.
    /// - Returns:
    ///     The modified `CAGradientLayer`.
    @discardableResult public func with(type: CAGradientLayerType) -> Self {
        self.type = type
        return self
    }
}
