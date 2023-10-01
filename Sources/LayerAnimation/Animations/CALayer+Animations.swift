//
//  CALayer+Animations.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

extension CALayer {
    public enum LayerAnimatable: Animatable {
        case contents(Any?)
        case contentsRect(CGRect)
        case contentsCenter(CGRect)

        case opacity(Float)
        case isHidden(Bool)
        case masksToBounds(Bool)
        case isDoubleSided(Bool)
        case cornerRadius(CGFloat)
        case borderWidth(CGFloat)
        case borderColor(CGColor?)
        case backgroundColor(CGColor?)
        case shadowOpacity(Float)
        case shadowRadius(CGFloat)
        case shadowOffset(CGSize)
        case shadowColor(CGColor?)
        case shadowPath(CGPath)

        case filters([Any]?)
        case compositingFilter(Any?)
        case backgroundFilters([Any]?)

        case shouldRasterize(Bool)
        case rasterizationScale(CGFloat)

        case bounds(CGRect)
        case position(CGPoint)
        case zPosition(CGFloat)
        case anchorPointZ(CGFloat)
        case anchorPoint(CGPoint)

        case transform(CATransform3D)
        case sublayerTransform(CATransform3D)

        public static func opacity(_ opacity: CGFloat) -> Self {
            .opacity(opacity.float)
        }

        public static func borderColor(_ borderColor: UIColor?) -> Self {
            .borderColor(borderColor?.cgColor)
        }

        public static func backgroundColor(_ backgroundColor: UIColor?) -> Self {
            .backgroundColor(backgroundColor?.cgColor)
        }

        public static func shadowOpacity(_ shadowOpacity: CGFloat) -> Self {
            .shadowOpacity(shadowOpacity.float)
        }

        public static func shadowColor(_ shadowColor: UIColor?) -> Self {
            .shadowColor(shadowColor?.cgColor)
        }

        /// The keypath of the property.
        public var keyPath: String {
            switch self {
            case .contents: return #keyPath(CALayer.contents)
            case .contentsRect: return #keyPath(CALayer.contentsRect)
            case .contentsCenter: return #keyPath(CALayer.contentsCenter)
            case .opacity: return #keyPath(CALayer.opacity)
            case .isHidden: return #keyPath(CALayer.isHidden)
            case .masksToBounds: return #keyPath(CALayer.masksToBounds)
            case .isDoubleSided: return #keyPath(CALayer.isDoubleSided)
            case .cornerRadius: return #keyPath(CALayer.cornerRadius)
            case .borderWidth: return #keyPath(CALayer.borderWidth)
            case .borderColor: return #keyPath(CALayer.borderColor)
            case .backgroundColor: return #keyPath(CALayer.backgroundColor)
            case .shadowOpacity: return #keyPath(CALayer.shadowOpacity)
            case .shadowRadius: return #keyPath(CALayer.shadowRadius)
            case .shadowOffset: return #keyPath(CALayer.shadowOffset)
            case .shadowColor: return #keyPath(CALayer.shadowColor)
            case .shadowPath: return #keyPath(CALayer.shadowPath)
            case .filters: return #keyPath(CALayer.filters)
            case .compositingFilter: return #keyPath(CALayer.compositingFilter)
            case .backgroundFilters: return #keyPath(CALayer.backgroundFilters)
            case .shouldRasterize: return #keyPath(CALayer.shouldRasterize)
            case .rasterizationScale: return #keyPath(CALayer.rasterizationScale)
            case .bounds: return #keyPath(CALayer.bounds)
            case .position: return #keyPath(CALayer.position)
            case .zPosition: return #keyPath(CALayer.zPosition)
            case .anchorPointZ: return #keyPath(CALayer.anchorPointZ)
            case .anchorPoint: return #keyPath(CALayer.anchorPoint)
            case .transform: return #keyPath(CALayer.transform)
            case .sublayerTransform: return #keyPath(CALayer.sublayerTransform)
            }
        }

        /// The desired final value of the animation.
        public var targetValue: Any {
            switch self {
            case let .contents(contents): return contents as Any
            case let .contentsRect(contentsRect): return contentsRect
            case let .contentsCenter(contentsCenter): return contentsCenter
            case let .opacity(opacity): return opacity.clamped(to: .zero...1)
            case let .isHidden(isHidden): return isHidden
            case let .masksToBounds(masksToBounds): return masksToBounds
            case let .isDoubleSided(isDoubleSided): return isDoubleSided
            case let .cornerRadius(cornerRadius): return cornerRadius.clamped(to: .zero...)
            case let .borderWidth(borderWidth): return borderWidth.clamped(to: .zero...)
            case let .borderColor(borderColor): return borderColor as Any
            case let .backgroundColor(backgroundColor): return backgroundColor as Any
            case let .shadowOpacity(shadowOpacity): return shadowOpacity.clamped(to: .zero...1)
            case let .shadowRadius(shadowRadius): return shadowRadius.clamped(to: .zero...)
            case let .shadowOffset(shadowOffset): return shadowOffset
            case let .shadowColor(shadowColor): return shadowColor as Any
            case let .shadowPath(shadowPath): return shadowPath
            case let .filters(filters): return filters as Any
            case let .compositingFilter(compositingFilter): return compositingFilter as Any
            case let .backgroundFilters(backgroundFilters): return backgroundFilters as Any
            case let .shouldRasterize(shouldRasterize): return shouldRasterize
            case let .rasterizationScale(rasterizationScale): return rasterizationScale
            case let .bounds(bounds): return bounds
            case let .position(position): return position
            case let .zPosition(zPosition): return zPosition
            case let .anchorPointZ(anchorPointZ): return anchorPointZ
            case let .anchorPoint(anchorPoint): return anchorPoint
            case let .transform(transform): return transform
            case let .sublayerTransform(sublayerTransform): return sublayerTransform
            }
        }
    }
}

extension CALayer {
    /// Make a `CALayer`.
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
                            sublayerTransform: CATransform3D? = nil) {
        self.init()
        self.contents =? contents
        self.contentsRect =? contentsRect
        self.contentsCenter =? contentsCenter
        self.opacity =? opacity
        self.isHidden =? isHidden
        self.masksToBounds =? masksToBounds
        self.isDoubleSided =? isDoubleSided
        self.cornerRadius =? cornerRadius
        self.borderWidth =? borderWidth
        self.borderColor =? borderColor
        self.backgroundColor =? backgroundColor
        self.shadowOpacity =? shadowOpacity
        self.shadowRadius =? shadowRadius
        self.shadowOffset =? shadowOffset
        self.shadowColor =? shadowColor
        self.shadowPath =? shadowPath
        self.filters =? filters
        self.compositingFilter =? compositingFilter
        self.backgroundFilters =? backgroundFilters
        self.shouldRasterize =? shouldRasterize
        self.rasterizationScale =? rasterizationScale
        self.bounds =? bounds
        self.position =? position
        self.zPosition =? zPosition
        self.anchorPointZ =? anchorPointZ
        self.anchorPoint =? anchorPoint
        self.transform =? transform
        self.sublayerTransform =? sublayerTransform
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - contents: the contents of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(contents: Any?) -> Self {
        self.contents = contents
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - contentsRect: the rectangle of the contents.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(contentsRect: CGRect) -> Self {
        self.contentsRect = contentsRect
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - contentsCenter: define how does the contents scaled if the layer resized.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(contentsCenter: CGRect) -> Self {
        self.contentsCenter = contentsCenter
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - opacity: the opacity of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(opacity: Float) -> Self {
        self.opacity = opacity
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - isHidden: whether the layer is hidden.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - masksToBounds: whether the sublayers are clipped to the layer's bounds.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(masksToBounds: Bool) -> Self {
        self.masksToBounds = masksToBounds
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - isDoubleSided: whether the content rendered on the background too.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(isDoubleSided: Bool) -> Self {
        self.isDoubleSided = isDoubleSided
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - cornerRadius: the radius of the corners of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(cornerRadius: CGFloat) -> Self {
        self.cornerRadius = cornerRadius
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - borderWidth: the width of the border of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(borderWidth: CGFloat) -> Self {
        self.borderWidth = borderWidth
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - borderColor: the color of the border of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(borderColor: CGColor?) -> Self {
        self.borderColor = borderColor
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - backgroundColor: the color of the background of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(backgroundColor: CGColor?) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - shadowOpacity: the opacity of the shadow of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(shadowOpacity: Float) -> Self {
        self.shadowOpacity = shadowOpacity
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - shadowRadius: the radius of the shadow of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(shadowRadius: CGFloat) -> Self {
        self.shadowRadius = shadowRadius
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - shadowOffset: the offset of the shadow of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(shadowOffset: CGSize) -> Self {
        self.shadowOffset = shadowOffset
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - shadowColor: the color of the shadow of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(shadowColor: CGColor?) -> Self {
        self.shadowColor = shadowColor
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - shadowPath: the path of the shadow of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(shadowPath: CGPath?) -> Self {
        self.shadowPath = shadowPath
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - filters: the filters that are applied to the layer and its sublayers.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(filters: [Any]?) -> Self {
        self.filters = filters
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - compositingFilter: the filter to composite the filter and the content behind that.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(compositingFilter: Any?) -> Self {
        self.compositingFilter = compositingFilter
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - backgroundFilters: the filters that are applied to the content behind the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(backgroundFilters: [Any]?) -> Self {
        self.backgroundFilters = backgroundFilters
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - shouldRasterize: whether the layer should be rasterized.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(shouldRasterize: Bool) -> Self {
        self.shouldRasterize = shouldRasterize
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - rasterizationScale: the scale at which to rasterize content, relative to the coordinate space of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(rasterizationScale: CGFloat) -> Self {
        self.rasterizationScale = rasterizationScale
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - bounds: the bounds of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(bounds: CGRect) -> Self {
        self.bounds = bounds
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - position: the position of the layer in the superlayer's coordinate space.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(position: CGPoint) -> Self {
        self.position = position
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - zPosition: the position of the layer along the z-axis.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(zPosition: CGFloat) -> Self {
        self.zPosition = zPosition
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - anchorPointZ: the anchor point of the layer along the z-axis.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(anchorPointZ: CGFloat) -> Self {
        self.anchorPointZ = anchorPointZ
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - anchorPoint: the anchor point of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(anchorPoint: CGPoint) -> Self {
        self.anchorPoint = anchorPoint
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - transform: the transform of the layer.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(transform: CATransform3D) -> Self {
        self.transform = transform
        return self
    }

    /// Specify the `CALayer`.
    /// - Parameters:
    ///   - sublayerTransform: the transform of the sublayers.
    /// - Returns:
    ///     The modified `CALayer`.
    @discardableResult public func with(sublayerTransform: CATransform3D) -> Self {
        self.sublayerTransform = sublayerTransform
        return self
    }
}

