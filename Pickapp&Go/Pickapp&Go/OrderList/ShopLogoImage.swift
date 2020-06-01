//
//  ShopLogoImage.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 01.06.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

class ShopLogoImage: UIImageView {
    
    // TODO: - Разобраться с двумя тенями
    lazy var dropShadow1: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.blue.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.shadowColor = UIColor.red.cgColor//UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: -2, height: -2)
        return layer
    }()
    
    lazy var dropShadow2: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.yellow.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.shadowColor = UIColor.green.cgColor//UIColor(red: 0.216, green: 0.329, blue: 0.667, alpha: 0.15).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 2, height: 2)
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 10

        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 0.216, green: 0.329, blue: 0.667, alpha: 0.15).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 4.0
        layer.shadowOffset = CGSize(width: 2, height: 2)
//        layer.insertSublayer(dropShadow1, at: 0)
//        layer.insertSublayer(dropShadow2, at: 0)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        dropShadow1.frame = bounds
        dropShadow2.frame = bounds
    }
    
}
