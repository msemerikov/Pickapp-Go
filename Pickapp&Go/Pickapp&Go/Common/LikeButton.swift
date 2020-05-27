//
//  LikeButton.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 27.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

class LikeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setImage(UIImage(named: "LikeNotactiveIcon"), for: .normal)
        setImage(UIImage(named: "LikeActiveIcon"), for: .selected)
        layer.cornerRadius = 12
        layer.masksToBounds = false
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
    }
    
}
