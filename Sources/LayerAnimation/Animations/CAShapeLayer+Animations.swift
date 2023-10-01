//
//  CAShapeLayer+Animations.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

extension CAShapeLayer {
    public enum ShapeLayerAnimatable: Animatable {
        case path(CGPath?)

        case fillColor(CGColor?)
        case lineDashPhase(CGFloat)
        case lineWidth(CGFloat)
        case miterLimit(CGFloat)
        case strokeStart(CGFloat)
        case strokeEnd(CGFloat)
        case strokeColor(CGColor?)

        public static func fillColor(_ fillColor: UIColor?) -> Self {
            .fillColor(fillColor?.cgColor)
        }

        public static func strokeColor(_ strokeColor: UIColor?) -> Self {
            .strokeColor(strokeColor?.cgColor)
        }

        /// The keypath of the property.
        public var keyPath: String {
            switch self {
            case .path: return #keyPath(CAShapeLayer.path)
            case .fillColor: return #keyPath(CAShapeLayer.fillColor)
            case .lineDashPhase: return #keyPath(CAShapeLayer.lineDashPhase)
            case .lineWidth: return #keyPath(CAShapeLayer.lineWidth)
            case .miterLimit: return #keyPath(CAShapeLayer.miterLimit)
            case .strokeStart: return #keyPath(CAShapeLayer.strokeStart)
            case .strokeEnd: return #keyPath(CAShapeLayer.strokeEnd)
            case .strokeColor: return #keyPath(CAShapeLayer.strokeColor)
            }
        }

        /// The desired final value of the animation.
        public var targetValue: Any {
            switch self {
            case let .path(path): return path as Any
            case let .fillColor(fillColor): return fillColor as Any
            case let .lineDashPhase(lineDashPhase): return lineDashPhase
            case let .lineWidth(lineWidth): return lineWidth.clamped(to: .zero...)
            case let .miterLimit(miterLimit): return miterLimit
            case let .strokeStart(strokeStart): return strokeStart.clamped(to: .zero...1)
            case let .strokeEnd(strokeEnd): return strokeEnd.clamped(to: .zero...1)
            case let .strokeColor(strokeColor): return strokeColor as Any
            }
        }
    }
}

extension CAShapeLayer {
    /// Make a `CATextLayer`.
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
    ///   - path: the path of the layer. By default `nil`.
    ///   - fillColor: the fill color of the layer. By default `nil`.
    ///   - lineDashPhase: the dash phase of the line. By default `nil`.
    ///   - lineWidth: the width of the line. By default `nil`.
    ///   - miterLimit: the mieter limit of the path. By default `nil`.
    ///   - strokeStart: the starting percent of the line's stroking. By default `nil`.
    ///   - strokeEnd: the ending percent of the line's stroking. By default `nil`.
    ///   - strokeColor: the color of the stroke. By default `nil`.
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
                            path: CGPath? = nil,
                            fillColor: CGColor? = nil,
                            lineDashPhase: CGFloat? = nil,
                            lineWidth: CGFloat? = nil,
                            miterLimit: CGFloat? = nil,
                            strokeStart: CGFloat? = nil,
                            strokeEnd: CGFloat? = nil,
                            strokeColor: CGColor? = nil) {
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
        self.path =? path
        self.fillColor =? fillColor
        self.lineDashPhase =? lineDashPhase
        self.lineWidth =? lineWidth
        self.miterLimit =? miterLimit
        self.strokeStart =? strokeStart
        self.strokeEnd =? strokeEnd
        self.strokeColor =? strokeColor
    }

    /// Specify the `CAShapeLayer`.
    /// - Parameters:
    ///   - path: the path of the layer.
    /// - Returns:
    ///     The modified `CAShapeLayer`.
    @discardableResult public func with(path: CGPath?) -> Self {
        self.path = path
        return self
    }

    /// Specify the `CAShapeLayer`.
    /// - Parameters:
    ///   - fillColor: the fill color of the layer.
    /// - Returns:
    ///     The modified `CAShapeLayer`.
    @discardableResult public func with(fillColor: CGColor?) -> Self {
        self.fillColor = fillColor
        return self
    }

    /// Specify the `CAShapeLayer`.
    /// - Parameters:
    ///   - fillColor: the fill color of the layer.
    /// - Returns:
    ///     The modified `CAShapeLayer`.
    @discardableResult public func with(fillColor: UIColor?) -> Self {
        with(fillColor: fillColor?.cgColor)
    }

    /// Specify the `CAShapeLayer`.
    /// - Parameters:
    ///   - lineDashPhase: the dash phase of the line.
    /// - Returns:
    ///     The modified `CAShapeLayer`.
    @discardableResult public func with(lineDashPhase: CGFloat) -> Self {
        self.lineDashPhase = lineDashPhase
        return self
    }

    /// Specify the `CAShapeLayer`.
    /// - Parameters:
    ///   - lineWidth: the width of the line.
    /// - Returns:
    ///     The modified `CAShapeLayer`.
    @discardableResult public func with(lineWidth: CGFloat) -> Self {
        self.lineWidth = lineWidth
        return self
    }

    /// Specify the `CAShapeLayer`.
    /// - Parameters:
    ///   - miterLimit: the miter limit of the path.
    /// - Returns:
    ///     The modified `CAShapeLayer`.
    @discardableResult public func with(miterLimit: CGFloat) -> Self {
        self.miterLimit = miterLimit
        return self
    }

    /// Specify the `CAShapeLayer`.
    /// - Parameters:
    ///   - strokeStart: the starting percent of the line's stroking.
    /// - Returns:
    ///     The modified `CAShapeLayer`.
    @discardableResult public func with(strokeStart: CGFloat) -> Self {
        self.strokeStart = strokeStart
        return self
    }

    /// Specify the `CAShapeLayer`.
    /// - Parameters:
    ///   - strokeEnd: the ending percent of the line's stroking.
    /// - Returns:
    ///     The modified `CAShapeLayer`.
    @discardableResult public func with(strokeEnd: CGFloat) -> Self {
        self.strokeEnd = strokeEnd
        return self
    }

    /// Specify the `CAShapeLayer`.
    /// - Parameters:
    ///   - strokeColor: the color of the stroke.
    /// - Returns:
    ///     The modified `CAShapeLayer`.
    @discardableResult public func with(strokeColor: CGColor?) -> Self {
        self.strokeColor = strokeColor
        return self
    }

    /// Specify the `CAShapeLayer`.
    /// - Parameters:
    ///   - strokeColor: the color of the stroke.
    /// - Returns:
    ///     The modified `CAShapeLayer`.
    @discardableResult public func with(strokeColor: UIColor?) -> Self {
        with(strokeColor: strokeColor?.cgColor)
    }
}
