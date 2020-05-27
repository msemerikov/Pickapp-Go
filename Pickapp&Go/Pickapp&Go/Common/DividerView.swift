//
//  DividerView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

class DividerView: UIView {
    
    init() {
        super.init(frame: .zero)
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.08).cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
