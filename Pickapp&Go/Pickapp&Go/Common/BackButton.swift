//
//  BackButton.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 26.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

class BackButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setImage(UIImage(named: "Back"), for: .normal)
        layer.cornerRadius = 12
        layer.masksToBounds = false
//        layer.shadowColor = UIColor.red.cgColor//UIColor(red: 0.216, green: 0.329, blue: 0.667, alpha: 0.15).cgColor
        layer.shadowColor = UIColor(red: 0.216, green: 0.329, blue: 0.667, alpha: 0.15).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 4.0
        layer.shadowOffset = CGSize(width: 2, height: 2)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // TODO: - Add second shadow
    override func layoutSubviews() {
        super.layoutSubviews()
//        let layer1 = CALayer()
//        layer1.frame = bounds
//        layer1.masksToBounds = false
//        layer1.backgroundColor = UIColor.vividOrange.cgColor
//        layer1.shadowColor = UIColor.red.cgColor//UIColor(red: 0.216, green: 0.329, blue: 0.667, alpha: 0.15).cgColor
//        layer1.shadowOpacity = 1.0
//        layer1.shadowRadius = 4.0
//        layer1.shadowOffset = CGSize(width: 2, height: 2)
//        layer1.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        layer.insertSublayer(layer1, below: layer)
//        layer.insertSublayer(layer1, below: layer)
//        dropShadow(color: .red, opacity: 1, offSet: CGSize(width: 2, height: 2), radius: 4, scale: true)
//        dropShadow(color: .green, opacity: 1, offSet: CGSize(width: -2, height: -2), radius: 4, scale: false)
//        layer.masksToBounds = false
//        layer.shadowColor = UIColor(red: 0.216, green: 0.329, blue: 0.667, alpha: 0.15).cgColor
//        layer.shadowOpacity = 1.0
//        layer.shadowRadius = 4.0
//        layer.shadowOffset = CGSize(width: 2, height: 2)
    }
    
}
