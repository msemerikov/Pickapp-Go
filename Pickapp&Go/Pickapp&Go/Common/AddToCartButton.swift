//
//  AddToCartButton.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 27.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

class AddToCartButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .vividOrange
        setTitle("В корзину", for: .normal)
        titleLabel?.font = .boldSystemFontOfSize(size: 14)
        layer.cornerRadius = 12
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 0.216, green: 0.329, blue: 0.667, alpha: 0.15).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 4.0
        layer.shadowOffset = CGSize(width: 2, height: 2)
//        applyGradient(with: [UIColor(red: 1, green: 0.557, blue: 0.035, alpha: 0.90),
//                             UIColor(red: 1, green: 0.383, blue: 0.035, alpha: 0.89),
//                             UIColor(red: 1, green: 0.199, blue: 0.000, alpha: 0.89)],
//                      gradient: .addToCart)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // TODO: - Add second shadow
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

enum GradientOrientation {
    case topRightBottomLeft
    case topLeftBottomRight
    case horizontal
    case vertical
    case addToCart

    var startPoint: CGPoint {
        return points.startPoint
    }

    var endPoint: CGPoint {
        return points.endPoint
    }

    var points: GradientPoints {
        switch self {
        case .topRightBottomLeft:
            return (CGPoint(x: 0.0,y: 1.0), CGPoint(x: 1.0,y: 0.0))
        case .topLeftBottomRight:
            return (CGPoint(x: 0.0,y: 0.0), CGPoint(x: 1,y: 1))
        case .horizontal:
            return (CGPoint(x: 0.0,y: 0.5), CGPoint(x: 1.0,y: 0.5))
        case .vertical:
            return (CGPoint(x: 0.0,y: 0.0), CGPoint(x: 0.0,y: 1.0))
        case .addToCart:
            return (CGPoint(x: 0.25,y: 0.5), CGPoint(x: 0.75,y: 0.5))
        }
    }
}

extension UIView {

    func applyGradient(with colours: [UIColor], locations: [NSNumber]? = nil) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }

    func applyGradient(with colours: [UIColor], gradient orientation: GradientOrientation) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = orientation.startPoint
        gradient.endPoint = orientation.endPoint
        self.layer.insertSublayer(gradient, at: 0)
    }
}
