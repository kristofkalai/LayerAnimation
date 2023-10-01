//
//  CATextLayer+Animations.swift
//
//
//  Created by Kristóf Kálai on 01/10/2023.
//

import UIKit

extension CATextLayer {
    public enum CATextLayerAnimatable: Animatable {
        case fontSize(CGFloat)
        case foregroundColor(CGColor?)

        public static func foregroundColor(_ foregroundColor: UIColor?) -> Self {
            .foregroundColor(foregroundColor?.cgColor)
        }

        /// The keypath of the property.
        public var keyPath: String {
            switch self {
            case .fontSize: return #keyPath(CATextLayer.fontSize)
            case .foregroundColor: return #keyPath(CATextLayer.foregroundColor)
            }
        }

        /// The desired final value of the animation.
        public var targetValue: Any {
            switch self {
            case let .fontSize(fontSize): return fontSize
            case let .foregroundColor(foregroundColor): return foregroundColor as Any
            }
        }
    }
}

extension CATextLayer {
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
    ///   - sublayerTransform: the transform of the sublayers. By default `nil`.
    ///   - fontSize: the size of the font. By default `nil`.
    ///   - foregroundColor: the color of the text. By default `nil`.
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
                            fontSize: CGFloat? = nil,
                            foregroundColor: CGColor? = nil) {
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
        self.fontSize =? fontSize
        self.foregroundColor =? foregroundColor
    }

    /// Specify the `CATextLayer`.
    /// - Parameters:
    ///   - fontSize: the size of the font.
    /// - Returns:
    ///     The modified `CATextLayer`.
    @discardableResult public func with(fontSize: CGFloat) -> Self {
        self.fontSize = fontSize
        return self
    }

    /// Specify the `CATextLayer`.
    /// - Parameters:
    ///   - foregroundColor: the color of the text.
    /// - Returns:
    ///     The modified `CATextLayer`.
    @discardableResult public func with(foregroundColor: CGColor?) -> Self {
        self.foregroundColor = foregroundColor
        return self
    }
}
