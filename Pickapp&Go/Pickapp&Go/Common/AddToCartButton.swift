//
//  AddToCartButton.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 27.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

class AddToCartButton: UIButton {
    
    lazy var shadow: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 12
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: -2, height: -2)
        return layer
    }()
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.backgroundColor = nil
        gradient.colors = [UIColor(red: 1, green: 0.557, blue: 0.035, alpha: 0.90),
                           UIColor(red: 1, green: 0.383, blue: 0.035, alpha: 0.89),
                           UIColor(red: 1, green: 0.199, blue: 0.000, alpha: 0.89)].map { $0.cgColor }
        gradient.cornerRadius = 12
        gradient.locations = [0, 0.5, 1]
        return gradient
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = nil
        setTitle("В корзину", for: .normal)
        titleLabel?.font = .boldSystemFontOfSize(size: 14)
        layer.cornerRadius = 12
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 0.216, green: 0.329, blue: 0.667, alpha: 0.15).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 4.0
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.backgroundColor = UIColor.white.cgColor
        layer.insertSublayer(shadow, at: 0)
        layer.insertSublayer(gradient, above: shadow)
        layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        shadow.frame = bounds
        gradient.frame = bounds
    }
    
}
